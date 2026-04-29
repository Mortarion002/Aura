import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class Toggle1224 extends StatelessWidget {
  final bool is24Hour;
  final ValueChanged<bool> onChanged;

  const Toggle1224({super.key, required this.is24Hour, required this.onChanged});

  @override
  Widget build(BuildContext context) => _SegmentPill(
    segments: const ['12h', '24h'],
    selectedIndex: is24Hour ? 1 : 0,
    onSelected: (i) => onChanged(i == 1),
  );
}

class ToggleCF extends StatelessWidget {
  final bool isCelsius;
  final VoidCallback onToggle;

  const ToggleCF({super.key, required this.isCelsius, required this.onToggle});

  @override
  Widget build(BuildContext context) => _SegmentPill(
    segments: const ['°C', '°F'],
    selectedIndex: isCelsius ? 0 : 1,
    onSelected: (_) => onToggle(),
  );
}

class _SegmentPill extends StatelessWidget {
  final List<String> segments;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _SegmentPill({
    required this.segments,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(segments.length, (i) {
          final active = selectedIndex == i;
          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? kBlack : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                segments[i],
                style: AppTextStyles.labelSmall(
                  color: active ? kWhite : kDim,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
