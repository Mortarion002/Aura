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
    final hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfo(
            icon: Icons.wb_sunny_outlined,
            label: 'Sunrise',
            time: _formatTime(sunrise),
          ),
          _buildInfo(
            icon: Icons.brightness_3_outlined,
            label: 'Sunset',
            time: _formatTime(sunset),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo({required IconData icon, required String label, required String time}) {
    return Row(
      children: [
        Icon(icon, color: kTextPrimary, size: 24),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(color: kTextSecond),
            ),
            Text(
              time,
              style: AppTextStyles.cardCity.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
