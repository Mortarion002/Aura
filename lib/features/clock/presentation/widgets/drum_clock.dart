import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';
import 'drum_digit.dart';

class DrumClock extends StatelessWidget {
  final DateTime time;
  final bool is24Hour;

  const DrumClock({
    super.key,
    required this.time,
    required this.is24Hour,
  });

  @override
  Widget build(BuildContext context) {
    int hours = time.hour;
    if (!is24Hour) {
      hours = hours % 12;
      if (hours == 0) hours = 12;
    }
    
    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = time.minute.toString().padLeft(2, '0');
    final formattedSeconds = time.second.toString().padLeft(2, '0');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRow(
          tensValue: int.parse(formattedHours[0]),
          onesValue: int.parse(formattedHours[1]),
          unit: 'h',
          textStyle: AppTextStyles.displayHours,
        ),
        _buildRow(
          tensValue: int.parse(formattedMinutes[0]),
          onesValue: int.parse(formattedMinutes[1]),
          unit: 'min',
          textStyle: AppTextStyles.displayMinutes,
        ),
        _buildRow(
          tensValue: int.parse(formattedSeconds[0]),
          onesValue: int.parse(formattedSeconds[1]),
          unit: 'sec',
          textStyle: AppTextStyles.displaySeconds,
        ),
      ],
    );
  }

  Widget _buildRow({
    required int tensValue,
    required int onesValue,
    required String unit,
    required TextStyle textStyle,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrumDigit(value: tensValue, textStyle: textStyle),
        DrumDigit(value: onesValue, textStyle: textStyle),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            unit,
            style: AppTextStyles.displayUnit,
          ),
        ),
      ],
    );
  }
}
