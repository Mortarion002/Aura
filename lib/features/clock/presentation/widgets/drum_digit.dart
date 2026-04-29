import 'package:flutter/material.dart';

class DrumDigit extends StatelessWidget {
  final int value;
  final TextStyle textStyle;

  const DrumDigit({
    super.key,
    required this.value,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Slide up animation: new value comes from bottom, old value goes up
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.5),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ));

        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
      child: Text(
        '$value',
        key: ValueKey<int>(value),
        style: textStyle,
      ),
    );
  }
}
