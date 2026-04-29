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
    final period = time.hour >= 12 ? 'pm' : 'am';
    return '${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
                icon: Icons.wb_twilight,
                time: _formatTime(sunset),
                color: kBlack,
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 52,
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
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 6),
        Text(
          time,
          style: AppTextStyles.cardTime.copyWith(
            fontSize: 13,
            color: kTextSecond,
            height: 1,
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
      ..color = kBlack.withValues(alpha: 0.34)
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()
      ..color = kBlack
      ..style = PaintingStyle.fill;

    final baselinePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.65)
      ..strokeWidth = 1;

    final w = size.width;
    final h = size.height;
    final baselineY = h * 0.62;
    canvas.drawLine(Offset(0, baselineY), Offset(w, baselineY), baselinePaint);

    const int dotCount = 42;
    for (int i = 0; i <= dotCount; i++) {
      final t = i / dotCount;
      final x = t * w;
      final y =
          baselineY - (1 - (2 * t - 1).abs() * (2 * t - 1).abs()) * h * 0.46;
      canvas.drawCircle(Offset(x, y), 1.2, paint);
    }

    double progress = 0.0;
    final totalDuration = sunset.difference(sunrise).inMinutes;
    final elapsed = now.difference(sunrise).inMinutes;

    if (totalDuration > 0) {
      progress = elapsed / totalDuration;
    }
    progress = progress.clamp(-0.2, 1.2);

    double x = progress * w;
    x = x.clamp(0.0, w);
    final t = x / w;
    final y =
        baselineY - (1 - (2 * t - 1).abs() * (2 * t - 1).abs()) * h * 0.46;

    canvas.drawCircle(Offset(x, y), 5.0, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) {
    return oldDelegate.now.minute != now.minute;
  }
}
