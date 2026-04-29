import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/aura_logo.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../providers/clock_provider.dart';
import 'widgets/drum_digit.dart';

class ClockScreen extends ConsumerStatefulWidget {
  final int currentNavIndex;
  final ValueChanged<int> onNavigate;

  const ClockScreen({
    super.key,
    required this.currentNavIndex,
    required this.onNavigate,
  });

  @override
  ConsumerState<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends ConsumerState<ClockScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entranceCtrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _entranceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOutCubic));
    _entranceCtrl.forward();
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeCity = ref.watch(activeCityProvider);
    final currentTime = ref.watch(currentCityTimeProvider);
    final is24 = ref.watch(is24HourFormatProvider);

    int h = currentTime.hour;
    if (!is24) {
      h = h % 12;
      if (h == 0) h = 12;
    }
    final hStr = h.toString().padLeft(2, '0');
    final mStr = currentTime.minute.toString().padLeft(2, '0');
    final sStr = currentTime.second.toString().padLeft(2, '0');
    final prevS = currentTime.second == 0 ? 59 : currentTime.second - 1;

    final dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final dayLabel = dayNames[currentTime.weekday % 7];
    final dateLabel =
        '${currentTime.day} ${monthNames[currentTime.month - 1]}';

    // Approx sunrise/sunset based on city latitude
    final sunriseH = 6.0 + (34 - activeCity.lat) * 0.04;
    final sunsetH  = 20.0 - (34 - activeCity.lat) * 0.04;
    final daylightH = sunsetH - sunriseH;
    final daylightMin = ((daylightH % 1) * 60).round();
    final isDay = currentTime.hour >= sunriseH && currentTime.hour < sunsetH;

    String fmtSunHour(double h) {
      final hr = h.floor();
      final mn = ((h - hr) * 60).round().toString().padLeft(2, '0');
      return '${hr.toString().padLeft(2, '0')}:$mn';
    }

    return SafeArea(
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AuraLogo(size: 32),
                    Toggle1224(
                      is24Hour: is24,
                      onChanged: (_) =>
                          ref.read(is24HourFormatProvider.notifier).toggle(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Hours row + date column
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HH drum digits
                    Row(
                      children: [
                        DrumDigit(
                          value: int.parse(hStr[0]),
                          textStyle: AppTextStyles.drumDigit(),
                        ),
                        DrumDigit(
                          value: int.parse(hStr[1]),
                          textStyle: AppTextStyles.drumDigit(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // Date column
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$dayLabel,',
                            style: AppTextStyles.dateLabel(),
                          ),
                          Text(dateLabel, style: AppTextStyles.dateLabel()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Minutes + seconds stack (no extra top padding — digits flush)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MM drum digits
                    Row(
                      children: [
                        DrumDigit(
                          value: int.parse(mStr[0]),
                          textStyle: AppTextStyles.drumDigit(),
                        ),
                        DrumDigit(
                          value: int.parse(mStr[1]),
                          textStyle: AppTextStyles.drumDigit(),
                        ),
                      ],
                    ),
                    // Seconds stack (prev faint, current bold)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prevS.toString().padLeft(2, '0'),
                            style: AppTextStyles.seconds(
                              color: Colors.black.withValues(alpha: 0.22),
                            ),
                          ),
                          Text(
                            sStr,
                            style: AppTextStyles.seconds(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // City name (word per line)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...activeCity.name.split(' ').map(
                        (w) => Text(w, style: AppTextStyles.cityHero()),
                      ),
                      const SizedBox(height: 10),
                      // Sunrise info
                      Row(
                        children: [
                          Icon(
                            isDay ? Icons.wb_sunny : Icons.brightness_2,
                            size: 14,
                            color: isDay ? kOrange : const Color(0xFF555555),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${daylightH.floor()}h ${daylightMin.toString().padLeft(2, '0')}m daylight',
                            style: AppTextStyles.cardUtc(size: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${fmtSunHour(sunriseH)} → ${fmtSunHour(sunsetH)}',
                        style: AppTextStyles.cardUtc(size: 12),
                      ),
                    ],
                  ),
                ),
              ),

              // Embedded bottom nav
              BottomNavBar(
                currentIndex: widget.currentNavIndex,
                onTap: widget.onNavigate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
