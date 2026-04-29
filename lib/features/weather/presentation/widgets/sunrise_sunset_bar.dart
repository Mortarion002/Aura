import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class SunriseSunsetBar extends StatelessWidget {
  final DateTime sunrise;
  final DateTime sunset;

  const SunriseSunsetBar({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  String _formatTime(DateTime time) {
    final hour = time.hour > 12
        ? time.hour - 12
        : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfo(
                icon: Icons.wb_sunny_outlined,
                time: _formatTime(sunrise),
                color: kOrange,
              ),
              _buildInfo(
                icon: Icons.brightness_3_outlined,
                time: _formatTime(sunset),
                color: kBlack,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: _ArcPainter(
                sunrise: sunrise,
                sunset: sunset,
                now: DateTime.now(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo({
    required IconData icon,
    required String time,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          time.toLowerCase(),
          style: AppTextStyles.cardCity.copyWith(
            fontSize: 14,
            color: kTextSecond,
          ),
        ),
      ],
    );
  }
}

class _ArcPainter extends CustomPainter {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime now;

  _ArcPainter({required this.sunrise, required this.sunset, required this.now});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kBlack.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()
      ..color = kBlack
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // Draw dotted curve (sine wave)
    const int dotCount = 40;
    for (int i = 0; i <= dotCount; i++) {
      double t = i / dotCount;
      double x = t * w;
      // Arc formula: y = h - sin(t * pi) * h
      double y = h - (1 - (2 * t - 1).abs() * (2 * t - 1).abs()) * h * 0.8;
      canvas.drawCircle(Offset(x, y), 1.5, paint);
    }

    // Calculate position for current time
    double progress = 0.0;
    final totalDuration = sunset.difference(sunrise).inMinutes;
    final elapsed = now.difference(sunrise).inMinutes;

    if (totalDuration > 0) {
      progress = elapsed / totalDuration;
    }
    // Clamp between -0.2 and 1.2 to show it before sunrise or after sunset
    progress = progress.clamp(-0.2, 1.2);

    // If it's night time, maybe show it flat? For now, just follow the curve extended.
    double x = progress * w;
    x = x.clamp(0.0, w);
    double t = x / w;
    double y = h - (1 - (2 * t - 1).abs() * (2 * t - 1).abs()) * h * 0.8;

    canvas.drawCircle(Offset(x, y), 5.0, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) {
    return oldDelegate.now.minute != now.minute;
  }
}
