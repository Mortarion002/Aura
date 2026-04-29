import 'package:flutter/material.dart';
import 'core/widgets/bottom_nav_bar.dart';
import 'core/widgets/orange_border_scaffold.dart';
import 'features/clock/presentation/clock_screen.dart';
import 'features/weather/presentation/weather_screen.dart';
import 'features/settings/presentation/settings_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return OrangeBorderScaffold(
      body: Stack(
        children: [
          // Content layer
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                const ClockScreen(),
                const WeatherScreen(),
                const SettingsScreen(),
              ],
            ),
          ),
          
          // Bottom Nav Bar floating layer
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
