import 'package:flutter/material.dart';

// Matches HTML: slideInUp .32s cubic-bezier(.34,1.56,.64,1) for incoming,
// slideOutUp .3s ease for outgoing.
class DrumDigit extends StatelessWidget {
  final int value;
  final TextStyle textStyle;

  const DrumDigit({super.key, required this.value, required this.textStyle});

  static const _springCurve = Cubic(0.34, 1.56, 0.64, 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      reverseDuration: const Duration(milliseconds: 300),
      switchInCurve: _springCurve,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        final isLeaving = animation.status == AnimationStatus.reverse ||
            animation.status == AnimationStatus.dismissed;

        // Incoming: slides up from +60% below → 0
        // Outgoing: slides up to -60% above
        final slideOffset = isLeaving
            ? Tween<Offset>(begin: const Offset(0, -0.6), end: Offset.zero)
                .animate(animation)
            : Tween<Offset>(begin: const Offset(0, 0.6), end: Offset.zero)
                .animate(animation);

        return ClipRect(
          child: SlideTransition(
            position: slideOffset,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: SizedBox(
        key: ValueKey<int>(value),
        child: Text('$value', style: textStyle),
      ),
    );
  }
}
