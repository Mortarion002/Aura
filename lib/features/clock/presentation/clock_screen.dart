import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../providers/clock_provider.dart';
import 'widgets/drum_clock.dart';
import 'world_clock_screen.dart';

class ClockScreen extends ConsumerWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: const [
        _DrumClockView(),
        WorldClockScreen(),
      ],
    );
  }
}

class _DrumClockView extends ConsumerStatefulWidget {
  const _DrumClockView();

  @override
  ConsumerState<_DrumClockView> createState() => _DrumClockViewState();
}

class _DrumClockViewState extends ConsumerState<_DrumClockView>
    with SingleTickerProviderStateMixin {
  late AnimationController _entranceController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutCubic,
    ));
    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeCity = ref.watch(activeCityProvider);
    final currentTime = ref.watch(currentCityTimeProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Semantics(
                      label: 'Clock icon',
                      child: const Icon(Icons.watch_later_outlined, size: 28),
                    ),
                    Semantics(
                      label: is24Hour ? '24-hour format active' : '12-hour format active',
                      child: Toggle1224(
                        is24Hour: is24Hour,
                        onChanged: (_) => ref.read(is24HourFormatProvider.notifier).toggle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                // Hero Clock and Date Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Stacked drum-roll numerals
                    Semantics(
                      label: 'Current time: ${currentTime.hour}:${currentTime.minute.toString().padLeft(2, '0')}',
                      excludeSemantics: true,
                      child: DrumClock(
                        time: currentTime,
                        is24Hour: is24Hour,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Date and extra info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_getShortDay(currentTime.weekday)},\n${currentTime.day} ${_getShortMonth(currentTime.month)}',
                            style: AppTextStyles.cardCity.copyWith(fontSize: 24, height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // City name
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    activeCity.name,
                    style: AppTextStyles.displayHours.copyWith(
                      fontSize: 64,
                      letterSpacing: -2,
                      height: 1.1,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${activeCity.country},',
                    style: AppTextStyles.displayHours.copyWith(
                      fontSize: 64,
                      letterSpacing: -2,
                      height: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 120), // Space for bottom nav bar
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getShortDay(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _getShortMonth(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }
}
