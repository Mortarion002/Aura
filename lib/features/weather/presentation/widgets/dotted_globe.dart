import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class DottedGlobe extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double size;

  const DottedGlobe({
    super.key,
    required this.latitude,
    required this.longitude,
    this.size = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          'Dotted world map showing latitude $latitude, longitude $longitude',
      child: SizedBox(
        width: size,
        height: size * 1.12,
        child: CustomPaint(
          painter: _HalftoneMapPainter(
            pinLatitude: latitude,
            pinLongitude: longitude,
          ),
        ),
      ),
    );
  }
}

class _HalftoneMapPainter extends CustomPainter {
  final double pinLatitude;
  final double pinLongitude;

  _HalftoneMapPainter({required this.pinLatitude, required this.pinLongitude});

  @override
  void paint(Canvas canvas, Size size) {
    final mapRect = Rect.fromLTWH(
      -size.width * 0.18,
      size.height * 0.03,
      size.width * 1.42,
      size.height * 0.86,
    );

    final landPaths = [
      _scalePath(_northAmerica(), mapRect),
      _scalePath(_centralAmerica(), mapRect),
      _scalePath(_southAmerica(), mapRect),
      _scalePath(_europeAfricaEdge(), mapRect),
    ];

    final dotPaint = Paint()
      ..color = kBlack.withValues(alpha: 0.78)
      ..style = PaintingStyle.fill;

    const spacing = 5.35;
    for (double y = mapRect.top; y < mapRect.bottom; y += spacing) {
      final rowOffset = ((y / spacing).floor().isEven) ? 0.0 : spacing * 0.48;
      for (
        double x = mapRect.left + rowOffset;
        x < mapRect.right;
        x += spacing
      ) {
        final point = Offset(x, y);
        if (_containsAny(landPaths, point)) {
          final depthFade = (1 - ((x - size.width * 0.5).abs() / size.width))
              .clamp(0.46, 1.0);
          canvas.drawCircle(point, 1.18 * depthFade, dotPaint);
        }
      }
    }

    final pin = _project(pinLatitude, pinLongitude, mapRect);
    final haloPaint = Paint()
      ..color = kOrange.withValues(alpha: 0.28)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(pin, 18, haloPaint);
    canvas.drawCircle(pin, 9, Paint()..color = kOrange);
    canvas.drawCircle(pin, 3.2, Paint()..color = kBlack);
  }

  bool _containsAny(List<Path> paths, Offset point) {
    for (final path in paths) {
      if (path.contains(point)) {
        return true;
      }
    }
    return false;
  }

  Offset _project(double latitude, double longitude, Rect rect) {
    const minLon = -170.0;
    const maxLon = 60.0;
    const maxLat = 74.0;
    const minLat = -58.0;

    final x = ((longitude - minLon) / (maxLon - minLon)).clamp(0.0, 1.0);
    final y = ((maxLat - latitude) / (maxLat - minLat)).clamp(0.0, 1.0);
    return Offset(rect.left + rect.width * x, rect.top + rect.height * y);
  }

  Path _northAmerica() {
    return Path()
      ..moveTo(0.02, 0.18)
      ..quadraticBezierTo(0.12, 0.06, 0.34, 0.05)
      ..quadraticBezierTo(0.56, 0.08, 0.69, 0.22)
      ..quadraticBezierTo(0.61, 0.30, 0.67, 0.39)
      ..quadraticBezierTo(0.56, 0.46, 0.43, 0.42)
      ..quadraticBezierTo(0.34, 0.39, 0.28, 0.48)
      ..quadraticBezierTo(0.18, 0.46, 0.12, 0.37)
      ..quadraticBezierTo(0.02, 0.34, 0.02, 0.18)
      ..close();
  }

  Path _centralAmerica() {
    return Path()
      ..moveTo(0.39, 0.45)
      ..quadraticBezierTo(0.48, 0.44, 0.55, 0.50)
      ..quadraticBezierTo(0.59, 0.55, 0.68, 0.55)
      ..quadraticBezierTo(0.68, 0.59, 0.61, 0.60)
      ..quadraticBezierTo(0.51, 0.57, 0.42, 0.52)
      ..quadraticBezierTo(0.36, 0.49, 0.39, 0.45)
      ..close();
  }

  Path _southAmerica() {
    return Path()
      ..moveTo(0.60, 0.57)
      ..quadraticBezierTo(0.75, 0.57, 0.82, 0.70)
      ..quadraticBezierTo(0.76, 0.84, 0.68, 0.98)
      ..quadraticBezierTo(0.57, 0.86, 0.55, 0.72)
      ..quadraticBezierTo(0.49, 0.63, 0.60, 0.57)
      ..close();
  }

  Path _europeAfricaEdge() {
    return Path()
      ..moveTo(0.88, 0.20)
      ..quadraticBezierTo(1.08, 0.14, 1.20, 0.28)
      ..quadraticBezierTo(1.11, 0.43, 1.17, 0.58)
      ..quadraticBezierTo(1.04, 0.67, 0.99, 0.82)
      ..quadraticBezierTo(0.89, 0.69, 0.91, 0.49)
      ..quadraticBezierTo(0.82, 0.36, 0.88, 0.20)
      ..close();
  }

  Path _scalePath(Path source, Rect rect) {
    final matrix = Float64List.fromList([
      rect.width,
      0,
      0,
      0,
      0,
      rect.height,
      0,
      0,
      0,
      0,
      1,
      0,
      rect.left,
      rect.top,
      0,
      1,
    ]);
    return source.transform(matrix);
  }

  @override
  bool shouldRepaint(covariant _HalftoneMapPainter oldDelegate) {
    return oldDelegate.pinLatitude != pinLatitude ||
        oldDelegate.pinLongitude != pinLongitude;
  }
}
