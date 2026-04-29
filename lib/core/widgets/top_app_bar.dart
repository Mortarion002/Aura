import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../features/clock/providers/clock_provider.dart';
import '../theme/colors.dart';
import 'toggle_12_24.dart';

class TopAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final is24Hour = ref.watch(is24HourFormatProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo Mark
            Text(
              'AURA',
              style: GoogleFonts.barlowCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: kBlack,
                letterSpacing: 2,
              ),
            ),

            // Dot-grid menu
            const Icon(Symbols.apps, color: kBlack, size: 28),

            // 12h/24h toggle
            Toggle1224(
              is24Hour: is24Hour,
              onChanged: (_) {
                ref.read(is24HourFormatProvider.notifier).toggle();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
