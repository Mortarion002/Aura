import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kWhite,
      colorScheme: const ColorScheme.light(
        primary: kOrange,
        onPrimary: kWhite,
        secondary: kBlack,
        onSecondary: kWhite,
        surface: kWhite,
        onSurface: kBlack,
      ),
      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: kBlack,
        displayColor: kBlack,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
    return base;
  }
}
