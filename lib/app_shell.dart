import 'package:flutter/material.dart';
import 'core/widgets/bottom_nav_bar.dart';
import 'features/clock/presentation/clock_screen.dart';
import 'features/world_clock/presentation/world_clock_screen.dart';
import 'features/weather/presentation/weather_screen.dart';
import 'features/timer/presentation/timer_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  void _navigate(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Clock screen owns its bottom nav
          ClockScreen(currentNavIndex: _currentIndex, onNavigate: _navigate),
          // Screens 1-3 get nav injected below
          _withNav(const WorldClockScreen()),
          _withNav(const WeatherScreen()),
          _withNav(const TimerScreen()),
        ],
      ),
    );
  }

  Widget _withNav(Widget screen) {
    return Column(
      children: [
        Expanded(child: screen),
        BottomNavBar(currentIndex: _currentIndex, onTap: _navigate),
      ],
    );
  }
}
