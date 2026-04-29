import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../theme/colors.dart';

enum NavTab { clock, world, weather, timer }

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _icons = [
    Symbols.schedule,
    Symbols.public,
    Symbols.wb_sunny,
    Symbols.timer,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_icons.length, (i) {
          final active = currentIndex == i;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: active ? kBlack : kCard,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[i],
                color: active ? kWhite : kDim,
                size: 22,
              ),
            ),
          );
        }),
      ),
    );
  }
}
