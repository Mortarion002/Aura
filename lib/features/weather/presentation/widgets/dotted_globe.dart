import 'dart:math' as math;
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
      label: 'Interactive globe showing location at latitude $latitude, longitude $longitude',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _DottedGlobePainter(
            pinLatitude: latitude,
            pinLongitude: longitude,
          ),
        ),
      ),
    );
  }
}

class _DottedGlobePainter extends CustomPainter {
  final double pinLatitude;
  final double pinLongitude;

  _DottedGlobePainter({
    required this.pinLatitude,
    required this.pinLongitude,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final dotPaint = Paint()
      ..color = kTextSecond.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final pinPaint = Paint()
      ..color = kOrange
      ..style = PaintingStyle.fill;

    // Draw the dotted sphere
    const int numLats = 18;
    const int numLons = 36;
    
    // Slight rotation to make the globe look better
    const double tilt = 0.2; 
    const double rotation = 0.5;

    for (int i = 0; i <= numLats; i++) {
      double lat = math.pi * i / numLats - math.pi / 2;
      for (int j = 0; j < numLons; j++) {
        double lon = 2 * math.pi * j / numLons;

        // Spherical to Cartesian coordinates
        double x = math.cos(lat) * math.sin(lon + rotation);
        double y = math.sin(lat);
        double z = math.cos(lat) * math.cos(lon + rotation);

        // Apply tilt (rotate around X axis)
        double ty = y * math.cos(tilt) - z * math.sin(tilt);
        double tz = y * math.sin(tilt) + z * math.cos(tilt);

        // Only draw front face (tz > 0)
        if (tz > -0.2) {
          // Perspective projection
          double scale = radius;
          double screenX = center.dx + x * scale;
          double screenY = center.dy - ty * scale; // Y is inverted on screen

          // Calculate dot radius based on depth (z) to give 3D feel
          double dotRadius = 1.5 + (tz + 1) * 0.5;

          canvas.drawCircle(Offset(screenX, screenY), dotRadius, dotPaint);
        }
      }
    }

    // Draw the pin
    // Convert pin lat/lon to radians
    double pLat = pinLatitude * math.pi / 180;
    double pLon = pinLongitude * math.pi / 180;

    double px = math.cos(pLat) * math.sin(pLon + rotation);
    double py = math.sin(pLat);
    double pz = math.cos(pLat) * math.cos(pLon + rotation);

    double pty = py * math.cos(tilt) - pz * math.sin(tilt);
    double ptz = py * math.sin(tilt) + pz * math.cos(tilt);

    // If pin is on the visible side
    if (ptz > -0.5) {
      double screenX = center.dx + px * radius;
      double screenY = center.dy - pty * radius;
      canvas.drawCircle(Offset(screenX, screenY), 5.0, pinPaint);
      
      // Pin outer ring
      final ringPaint = Paint()
        ..color = kOrange.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
      canvas.drawCircle(Offset(screenX, screenY), 12.0, ringPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _DottedGlobePainter oldDelegate) {
    return oldDelegate.pinLatitude != pinLatitude ||
        oldDelegate.pinLongitude != pinLongitude;
  }
}
