import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class SunriseSunsetBar extends StatelessWidget {
  final DateTime sunrise;
  final DateTime sunset;
  final int timezoneOffsetSeconds;

  const SunriseSunsetBar({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.timezoneOffsetSeconds,
  });

  DateTime _cityLocal(DateTime time) {
    return time.toUtc().add(Duration(seconds: timezoneOffsetSeconds));
  }

  String _formatTime(DateTime time) {
    final local = _cityLocal(time);
    final h = local.hour > 12
        ? local.hour - 12
        : (local.hour == 0 ? 12 : local.hour);
    final m = local.minute.toString().padLeft(2, '0');
    final period = local.hour >= 12 ? 'pm' : 'am';
    return '${h.toString().padLeft(2, '0')}:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
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
          const SizedBox(height: 8),
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
                reverse: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo({
    required IconData icon,
    required String time,
    required Color color,
    bool reverse = false,
  }) {
    final iconWidget = Icon(icon, color: color, size: 18);
    final textWidget = Text(
      time,
      style: AppTextStyles.cardTime(size: 13, color: kDim),
    );
    return Row(
      children: reverse
          ? [textWidget, const SizedBox(width: 6), iconWidget]
          : [iconWidget, const SizedBox(width: 6), textWidget],
    );
  }
}

class _ArcPainter extends CustomPainter {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime now;

  const _ArcPainter({
    required this.sunrise,
    required this.sunset,
    required this.now,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final baselineY = size.height * 0.76;
    const sidePadding = 2.0;
    final start = Offset(sidePadding, baselineY);
    final end = Offset(width - sidePadding, baselineY);
    final control = Offset(width / 2, size.height * 0.02);

    final baselinePaint = Paint()
      ..color = kCard
      ..strokeWidth = 1;
    canvas.drawLine(start, end, baselinePaint);

    final trackPaint = Paint()
      ..color = kDim.withValues(alpha: 0.48)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    _drawDashedArc(canvas, start, control, end, trackPaint);

    final totalDuration = sunset.difference(sunrise).inSeconds;
    final elapsed = now.difference(sunrise).inSeconds;
    final progress = totalDuration > 0
        ? (elapsed / totalDuration).clamp(0.0, 1.0)
        : 0.0;

    final progressPaint = Paint()
      ..color = kOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    _drawProgressArc(canvas, start, control, end, progress, progressPaint);

    final sun = _quadraticPoint(start, control, end, progress);
    canvas.drawCircle(sun, 6, Paint()..color = kOrange);
    canvas.drawCircle(sun, 3.5, Paint()..color = kOrangePeach);
  }

  void _drawDashedArc(
    Canvas canvas,
    Offset start,
    Offset control,
    Offset end,
    Paint paint,
  ) {
    const steps = 64;
    var drawing = true;
    for (var i = 0; i < steps; i++) {
      final a = i / steps;
      final b = (i + 0.58) / steps;
      if (drawing) {
        canvas.drawLine(
          _quadraticPoint(start, control, end, a),
          _quadraticPoint(start, control, end, b.clamp(0.0, 1.0)),
          paint,
        );
      }
      drawing = !drawing;
    }
  }

  void _drawProgressArc(
    Canvas canvas,
    Offset start,
    Offset control,
    Offset end,
    double progress,
    Paint paint,
  ) {
    if (progress <= 0) return;
    final path = Path()..moveTo(start.dx, start.dy);
    const steps = 48;
    final count = (steps * progress).ceil().clamp(1, steps);
    for (var i = 1; i <= count; i++) {
      final t = (i / steps).clamp(0.0, progress);
      final point = _quadraticPoint(start, control, end, t);
      path.lineTo(point.dx, point.dy);
    }
    canvas.drawPath(path, paint);
  }

  Offset _quadraticPoint(Offset start, Offset control, Offset end, double t) {
    final mt = 1 - t;
    return Offset(
      mt * mt * start.dx + 2 * mt * t * control.dx + t * t * end.dx,
      mt * mt * start.dy + 2 * mt * t * control.dy + t * t * end.dy,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcPainter old) =>
      old.now.minute != now.minute ||
      old.sunrise != sunrise ||
      old.sunset != sunset;
}
