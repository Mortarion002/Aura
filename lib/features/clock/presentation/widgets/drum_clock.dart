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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRow(
          tensValue: int.parse(formattedHours[0]),
          onesValue: int.parse(formattedHours[1]),
          textStyle: AppTextStyles.displayHours,
        ),
        _buildRow(
          tensValue: int.parse(formattedMinutes[0]),
          onesValue: int.parse(formattedMinutes[1]),
          textStyle: AppTextStyles.displayMinutes,
        ),
      ],
    );
  }

  Widget _buildRow({
    required int tensValue,
    required int onesValue,
    required TextStyle textStyle,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrumDigit(value: tensValue, textStyle: textStyle),
        DrumDigit(value: onesValue, textStyle: textStyle),
      ],
    );
  }
}
