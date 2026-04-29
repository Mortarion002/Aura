import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_shell.dart';
import 'core/theme/colors.dart';
import 'core/widgets/orange_border_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _navigationTimer;
  final String _title = "AURA";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _controller.forward().then((_) {
      _navigationTimer = Timer(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AppShell(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 800),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrangeBorderScaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_title.length, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Staggered animation calculation
                final start = index * 0.15;
                final end = start + 0.4;
                final curvedValue = CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    start.clamp(0.0, 1.0),
                    end.clamp(0.0, 1.0),
                    curve: Curves.easeOutBack,
                  ),
                ).value;

                return Opacity(
                  opacity: curvedValue.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - curvedValue)),
                    child: child,
                  ),
                );
              },
              child: Text(
                _title[index],
                style: GoogleFonts.barlowCondensed(
                  fontSize: 80,
                  fontWeight: FontWeight.w800,
                  color: kBlack,
                  letterSpacing: 8,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
