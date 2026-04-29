import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class WorldMapSvg extends StatelessWidget {
  final double activeLatitude;
  final double activeLongitude;

  const WorldMapSvg({
    super.key,
    required this.activeLatitude,
    required this.activeLongitude,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: _WorldMapPainter(
                    activeLatitude: activeLatitude,
                    activeLongitude: activeLongitude,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 34,
            child: CustomPaint(
              painter: _UtcAxisPainter(activeLongitude: activeLongitude),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('UTC -3', style: _axisStyle(false)),
                    Text('UTC -2', style: _axisStyle(false)),
                    Text('UTC -1', style: _axisStyle(false)),
                    Text('UTC 0', style: _axisStyle(false)),
                    Text('UTC +1', style: _axisStyle(true)),
                    Text('UTC +2', style: _axisStyle(false)),
                    Text('UTC +3', style: _axisStyle(false)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _axisStyle(bool active) {
    return AppTextStyles.labelSmall.copyWith(
      fontSize: 11,
      color: active ? kBlack : kTextSecond.withValues(alpha: 0.38),
      fontWeight: active ? FontWeight.w700 : FontWeight.w400,
    );
  }
}

class _WorldMapPainter extends CustomPainter {
  final double activeLatitude;
  final double activeLongitude;

  _WorldMapPainter({
    required this.activeLatitude,
    required this.activeLongitude,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final landPaint = Paint()
      ..color = kMapGrey
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = kPanelGrey.withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.55;
    final hatchPaint = Paint()
      ..color = kMapGrey.withValues(alpha: 0.32)
      ..strokeWidth = 0.8;
    final meridianPaint = Paint()
      ..color = const Color(0xFFE25A5A).withValues(alpha: 0.56)
      ..strokeWidth = 1;

    final mapRect = Offset.zero & size;
    _drawLand(canvas, mapRect, landPaint, borderPaint);
    _drawNorthHatch(canvas, mapRect, hatchPaint);

    final meridianX = _longitudeToX(activeLongitude, size.width);
    canvas.drawLine(
      Offset(meridianX, 0),
      Offset(meridianX, size.height),
      meridianPaint,
    );

    final marker = Offset(
      _longitudeToX(activeLongitude, size.width),
      _latitudeToY(activeLatitude, size.height),
    );
    final activeCountryPaint = Paint()
      ..color = kBlack
      ..style = PaintingStyle.fill;
    final highlight = _countryBlob(marker, size);
    canvas.drawPath(highlight, activeCountryPaint);

    canvas.drawCircle(marker, 5.5, Paint()..color = kBlack);
    canvas.drawCircle(
      marker,
      4.0,
      Paint()
        ..color = const Color(0xFFE25A5A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.7,
    );
  }

  void _drawLand(Canvas canvas, Rect rect, Paint landPaint, Paint borderPaint) {
    for (final path in [
      _northAmerica(),
      _southAmerica(),
      _greenland(),
      _europe(),
      _africa(),
      _asia(),
      _australia(),
    ]) {
      final scaled = _scalePath(path, rect);
      canvas.drawPath(scaled, landPaint);
      canvas.drawPath(scaled, borderPaint);
    }

    for (final island in [
      const Rect.fromLTWH(0.465, 0.205, 0.018, 0.024),
      const Rect.fromLTWH(0.515, 0.256, 0.012, 0.018),
      const Rect.fromLTWH(0.612, 0.17, 0.022, 0.022),
      const Rect.fromLTWH(0.785, 0.49, 0.014, 0.018),
      const Rect.fromLTWH(0.842, 0.65, 0.024, 0.03),
    ]) {
      canvas.drawOval(_scaleRect(island, rect), landPaint);
    }
  }

  void _drawNorthHatch(Canvas canvas, Rect rect, Paint paint) {
    for (double x = 0.58; x < 0.98; x += 0.012) {
      final start = Offset(
        rect.left + rect.width * x,
        rect.top + rect.height * 0.04,
      );
      final end = Offset(
        rect.left + rect.width * (x + 0.13),
        rect.top + rect.height * 0.42,
      );
      canvas.drawLine(start, end, paint);
    }
  }

  Path _countryBlob(Offset center, Size size) {
    final w = size.width * 0.05;
    final h = size.height * 0.14;
    return Path()
      ..moveTo(center.dx - w * 0.5, center.dy - h * 0.3)
      ..lineTo(center.dx - w * 0.12, center.dy - h * 0.55)
      ..lineTo(center.dx + w * 0.42, center.dy - h * 0.42)
      ..lineTo(center.dx + w * 0.55, center.dy + h * 0.08)
      ..lineTo(center.dx + w * 0.12, center.dy + h * 0.48)
      ..lineTo(center.dx - w * 0.46, center.dy + h * 0.35)
      ..close();
  }

  Path _northAmerica() {
    return Path()
      ..moveTo(0.00, 0.28)
      ..quadraticBezierTo(0.10, 0.12, 0.27, 0.15)
      ..quadraticBezierTo(0.37, 0.19, 0.34, 0.34)
      ..quadraticBezierTo(0.28, 0.42, 0.36, 0.49)
      ..quadraticBezierTo(0.28, 0.56, 0.18, 0.50)
      ..quadraticBezierTo(0.10, 0.48, 0.04, 0.55)
      ..quadraticBezierTo(0.00, 0.47, 0.00, 0.28)
      ..close();
  }

  Path _southAmerica() {
    return Path()
      ..moveTo(0.27, 0.55)
      ..quadraticBezierTo(0.38, 0.57, 0.42, 0.69)
      ..quadraticBezierTo(0.39, 0.84, 0.33, 0.97)
      ..quadraticBezierTo(0.25, 0.82, 0.24, 0.70)
      ..quadraticBezierTo(0.19, 0.61, 0.27, 0.55)
      ..close();
  }

  Path _greenland() {
    return Path()
      ..moveTo(0.31, 0.03)
      ..quadraticBezierTo(0.43, 0.00, 0.45, 0.14)
      ..quadraticBezierTo(0.38, 0.22, 0.30, 0.16)
      ..quadraticBezierTo(0.25, 0.08, 0.31, 0.03)
      ..close();
  }

  Path _europe() {
    return Path()
      ..moveTo(0.49, 0.25)
      ..quadraticBezierTo(0.55, 0.19, 0.63, 0.25)
      ..quadraticBezierTo(0.61, 0.35, 0.52, 0.35)
      ..quadraticBezierTo(0.46, 0.31, 0.49, 0.25)
      ..close();
  }

  Path _africa() {
    return Path()
      ..moveTo(0.51, 0.37)
      ..quadraticBezierTo(0.62, 0.34, 0.66, 0.49)
      ..quadraticBezierTo(0.63, 0.68, 0.56, 0.82)
      ..quadraticBezierTo(0.47, 0.69, 0.47, 0.51)
      ..quadraticBezierTo(0.45, 0.41, 0.51, 0.37)
      ..close();
  }

  Path _asia() {
    return Path()
      ..moveTo(0.62, 0.22)
      ..quadraticBezierTo(0.83, 0.17, 1.00, 0.30)
      ..lineTo(1.00, 0.58)
      ..quadraticBezierTo(0.86, 0.59, 0.78, 0.47)
      ..quadraticBezierTo(0.66, 0.47, 0.60, 0.36)
      ..quadraticBezierTo(0.57, 0.27, 0.62, 0.22)
      ..close();
  }

  Path _australia() {
    return Path()
      ..moveTo(0.82, 0.70)
      ..quadraticBezierTo(0.96, 0.67, 1.00, 0.76)
      ..lineTo(1.00, 0.93)
      ..quadraticBezierTo(0.88, 0.94, 0.78, 0.84)
      ..quadraticBezierTo(0.76, 0.75, 0.82, 0.70)
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

  Rect _scaleRect(Rect source, Rect rect) {
    return Rect.fromLTWH(
      rect.left + source.left * rect.width,
      rect.top + source.top * rect.height,
      source.width * rect.width,
      source.height * rect.height,
    );
  }

  double _longitudeToX(double longitude, double width) {
    return ((longitude + 180) / 360).clamp(0.0, 1.0) * width;
  }

  double _latitudeToY(double latitude, double height) {
    return ((90 - latitude) / 180).clamp(0.0, 1.0) * height;
  }

  @override
  bool shouldRepaint(covariant _WorldMapPainter oldDelegate) {
    return oldDelegate.activeLatitude != activeLatitude ||
        oldDelegate.activeLongitude != activeLongitude;
  }
}

class _UtcAxisPainter extends CustomPainter {
  final double activeLongitude;

  _UtcAxisPainter({required this.activeLongitude});

  @override
  void paint(Canvas canvas, Size size) {
    final x = ((activeLongitude + 180) / 360).clamp(0.0, 1.0) * size.width;
    final paint = Paint()
      ..color = const Color(0xFFE25A5A).withValues(alpha: 0.65)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(x, 0)
      ..lineTo(x - 4, 8)
      ..lineTo(x + 4, 8)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _UtcAxisPainter oldDelegate) {
    return oldDelegate.activeLongitude != activeLongitude;
  }
}
