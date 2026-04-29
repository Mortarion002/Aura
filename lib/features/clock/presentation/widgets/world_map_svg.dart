import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class WorldMapSvg extends StatelessWidget {
  final double activeLongitude;

  const WorldMapSvg({super.key, required this.activeLongitude});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // Stylized Map Background (Grid/Dots)
                  CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: _MapGridPainter(),
                  ),

                  // Meridian Line
                  Positioned(
                    left: _getMeridianX(constraints.maxWidth, activeLongitude),
                    top: 0,
                    bottom: 0,
                    child: Container(width: 2, color: kOrange),
                  ),
                ],
              );
            },
          ),
        ),

        // UTC Axis Labels
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('-12', style: AppTextStyles.labelSmall),
            Text('UTC', style: AppTextStyles.labelSmall),
            Text('+12', style: AppTextStyles.labelSmall),
          ],
        ),
      ],
    );
  }

  double _getMeridianX(double width, double longitude) {
    // Map longitude (-180 to 180) to x coordinate (0 to width)
    final normalizedLon = (longitude + 180) / 360;
    return width * normalizedLon;
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kTextSecond.withValues(alpha: 0.2)
      ..strokeWidth = 1.0;

    // Draw horizontal grid lines
    for (int i = 0; i <= 6; i++) {
      final y = size.height * (i / 6);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw vertical grid lines
    for (int i = 0; i <= 12; i++) {
      final x = size.width * (i / 12);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // In a full implementation, we would draw an SVG world map here
    // using flutter_svg's svg.string(...) or draw path.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
