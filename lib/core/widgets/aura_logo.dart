import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// Geometric Aura "A" logo — outer orbit ring, inner arc, bold A strokes.
class AuraLogo extends StatelessWidget {
  final double size;
  final Color color;

  const AuraLogo({super.key, this.size = 32, this.color = kBlack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _AuraLogoPainter(color: color)),
    );
  }
}

class _AuraLogoPainter extends CustomPainter {
  final Color color;
  _AuraLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final cx = s / 2;
    final cy = s / 2;

    // Outer orbit ring
    canvas.drawCircle(
      Offset(cx, cy),
      s * 0.422,
      Paint()
        ..color = color.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.0375,
    );

    // Inner halo arc (M 7 17 A 9.2 9.2 0 0 1 25 17 in 32px coords)
    final arcPaint = Paint()
      ..color = color.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.0406
      ..strokeCap = StrokeCap.round;

    const r32 = 9.2;
    final arcR = s * r32 / 32;
    // Arc from (7,17) to (25,17): center is (16, 17-sqrt(r^2 - 9^2))
    final dx = s * 9.0 / 32; // half-chord
    final arcCenterY = s * 17.0 / 32 - math.sqrt(arcR * arcR - dx * dx);
    final startAngle =
        math.atan2(s * 17.0 / 32 - arcCenterY, s * 7.0 / 32 - cx);
    final endAngle =
        math.atan2(s * 17.0 / 32 - arcCenterY, s * 25.0 / 32 - cx);
    final sweepAngle = endAngle - startAngle;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, arcCenterY), radius: arcR),
      startAngle,
      sweepAngle,
      false,
      arcPaint,
    );

    // Bold geometric A
    final aPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.0813
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Left leg: (16,7) → (6.5,24)
    canvas.drawLine(
      Offset(s * 16 / 32, s * 7 / 32),
      Offset(s * 6.5 / 32, s * 24 / 32),
      aPaint,
    );
    // Right leg: (16,7) → (25.5,24)
    canvas.drawLine(
      Offset(s * 16 / 32, s * 7 / 32),
      Offset(s * 25.5 / 32, s * 24 / 32),
      aPaint,
    );
    // Crossbar: (10.5,19) → (21.5,19)
    canvas.drawLine(
      Offset(s * 10.5 / 32, s * 19 / 32),
      Offset(s * 21.5 / 32, s * 19 / 32),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.075
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_AuraLogoPainter old) => old.color != color;
}
