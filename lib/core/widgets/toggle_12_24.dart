import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class Toggle1224 extends StatelessWidget {
  final bool is24Hour;
  final ValueChanged<bool> onChanged;

  const Toggle1224({
    super.key,
    required this.is24Hour,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: kCardLight,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSegment(
            text: '12h',
            isSelected: !is24Hour,
            onTap: () => onChanged(false),
          ),
          _buildSegment(
            text: '24h',
            isSelected: is24Hour,
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? kBlack : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? Colors.white : kTextPrimary,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
