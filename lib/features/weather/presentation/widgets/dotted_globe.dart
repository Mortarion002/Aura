import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class DottedGlobe extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double centerLongitude;
  final double size;

  const DottedGlobe({
    super.key,
    required this.latitude,
    required this.longitude,
    double? centerLongitude,
    this.size = 300,
  }) : centerLongitude = centerLongitude ?? longitude;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          'Rotating dotted globe showing latitude $latitude, longitude $longitude',
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _OrthographicGlobePainter(
            centerLatitude: latitude,
            centerLongitude: centerLongitude,
            pinLatitude: latitude,
            pinLongitude: longitude,
          ),
        ),
      ),
    );
  }
}

class _OrthographicGlobePainter extends CustomPainter {
  final double centerLatitude;
  final double centerLongitude;
  final double pinLatitude;
  final double pinLongitude;

  const _OrthographicGlobePainter({
    required this.centerLatitude,
    required this.centerLongitude,
    required this.pinLatitude,
    required this.pinLongitude,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.shortestSide * 0.48;
    final center = Offset(size.width / 2, size.height / 2);
    final phi0 = _degToRad(centerLatitude);
    final lam0 = _degToRad(_wrapLongitude(centerLongitude));

    final seaPaint = Paint()
      ..color = kMapGrey.withValues(alpha: 0.22)
      ..style = PaintingStyle.fill;
    final landPaint = Paint()
      ..color = kBlack.withValues(alpha: 0.78)
      ..style = PaintingStyle.fill;

    final clip = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.save();
    canvas.clipPath(clip);

    for (double lat = -78; lat <= 78; lat += 4.6) {
      final row = ((lat + 78) / 4.6).round();
      final lonOffset = row.isEven ? 0.0 : 2.3;
      for (double lon = -180 + lonOffset; lon <= 180; lon += 4.6) {
        final projected = _project(
          latitude: lat,
          longitude: lon,
          phi0: phi0,
          lam0: lam0,
          radius: radius,
          center: center,
        );
        if (projected == null) continue;

        final isLand = _isLand(lat, lon);
        canvas.drawCircle(
          projected,
          isLand ? 2.2 : 1.2,
          isLand ? landPaint : seaPaint,
        );
      }
    }

    canvas.restore();

    final pin = _project(
      latitude: pinLatitude,
      longitude: pinLongitude,
      phi0: phi0,
      lam0: lam0,
      radius: radius,
      center: center,
    );
    if (pin != null) {
      canvas.drawCircle(
        pin,
        12,
        Paint()
          ..color = kOrange.withValues(alpha: 0.18)
          ..style = PaintingStyle.fill,
      );
      canvas.drawCircle(pin, 6, Paint()..color = kOrange);
      canvas.drawCircle(pin, 3.2, Paint()..color = kBlack);
    }
  }

  Offset? _project({
    required double latitude,
    required double longitude,
    required double phi0,
    required double lam0,
    required double radius,
    required Offset center,
  }) {
    final phi = _degToRad(latitude);
    final lam = _degToRad(longitude);
    final dl = lam - lam0;
    final cosC =
        math.sin(phi0) * math.sin(phi) +
        math.cos(phi0) * math.cos(phi) * math.cos(dl);
    if (cosC <= 0) return null;

    final x = radius * math.cos(phi) * math.sin(dl);
    final y =
        -radius *
        (math.cos(phi0) * math.sin(phi) -
            math.sin(phi0) * math.cos(phi) * math.cos(dl));
    return Offset(center.dx + x, center.dy + y);
  }

  bool _isLand(double latitude, double longitude) {
    for (final polygon in _landPolygons) {
      if (polygon.contains(latitude, longitude)) return true;
    }
    return false;
  }

  double _degToRad(double degrees) => degrees * math.pi / 180;

  double _wrapLongitude(double longitude) {
    var wrapped = longitude % 360;
    if (wrapped > 180) wrapped -= 360;
    if (wrapped < -180) wrapped += 360;
    return wrapped;
  }

  @override
  bool shouldRepaint(covariant _OrthographicGlobePainter oldDelegate) {
    return oldDelegate.centerLatitude != centerLatitude ||
        oldDelegate.centerLongitude != centerLongitude ||
        oldDelegate.pinLatitude != pinLatitude ||
        oldDelegate.pinLongitude != pinLongitude;
  }
}

class _GeoPolygon {
  final List<_GeoPoint> points;

  const _GeoPolygon(this.points);

  bool contains(double latitude, double longitude) {
    var inside = false;
    for (int i = 0, j = points.length - 1; i < points.length; j = i++) {
      final pi = points[i];
      final pj = points[j];
      final intersects =
          (pi.lon > longitude) != (pj.lon > longitude) &&
          latitude <
              (pj.lat - pi.lat) * (longitude - pi.lon) / (pj.lon - pi.lon) +
                  pi.lat;
      if (intersects) inside = !inside;
    }
    return inside;
  }
}

class _GeoPoint {
  final double lat;
  final double lon;

  const _GeoPoint(this.lat, this.lon);
}

const _landPolygons = [
  _GeoPolygon([
    _GeoPoint(72, -168),
    _GeoPoint(70, -52),
    _GeoPoint(54, -52),
    _GeoPoint(45, -65),
    _GeoPoint(28, -81),
    _GeoPoint(14, -97),
    _GeoPoint(21, -112),
    _GeoPoint(32, -125),
    _GeoPoint(52, -160),
  ]),
  _GeoPolygon([
    _GeoPoint(18, -112),
    _GeoPoint(24, -78),
    _GeoPoint(8, -59),
    _GeoPoint(-55, -69),
    _GeoPoint(-54, -45),
    _GeoPoint(-15, -35),
    _GeoPoint(10, -48),
    _GeoPoint(15, -86),
  ]),
  _GeoPolygon([
    _GeoPoint(84, -58),
    _GeoPoint(76, -18),
    _GeoPoint(60, -18),
    _GeoPoint(58, -52),
    _GeoPoint(70, -72),
  ]),
  _GeoPolygon([
    _GeoPoint(72, -12),
    _GeoPoint(70, 42),
    _GeoPoint(48, 50),
    _GeoPoint(36, 31),
    _GeoPoint(35, -10),
    _GeoPoint(50, -24),
  ]),
  _GeoPolygon([
    _GeoPoint(36, -18),
    _GeoPoint(32, 52),
    _GeoPoint(-34, 51),
    _GeoPoint(-35, 18),
    _GeoPoint(-18, 8),
    _GeoPoint(-4, -15),
  ]),
  _GeoPolygon([
    _GeoPoint(72, 32),
    _GeoPoint(70, 178),
    _GeoPoint(48, 176),
    _GeoPoint(8, 124),
    _GeoPoint(-8, 100),
    _GeoPoint(18, 72),
    _GeoPoint(30, 42),
  ]),
  _GeoPolygon([
    _GeoPoint(8, 96),
    _GeoPoint(22, 122),
    _GeoPoint(4, 146),
    _GeoPoint(-11, 132),
    _GeoPoint(-8, 104),
  ]),
  _GeoPolygon([
    _GeoPoint(-10, 112),
    _GeoPoint(-11, 154),
    _GeoPoint(-44, 154),
    _GeoPoint(-44, 112),
  ]),
  _GeoPolygon([
    _GeoPoint(-66, -180),
    _GeoPoint(-66, 180),
    _GeoPoint(-82, 180),
    _GeoPoint(-82, -180),
  ]),
];
