import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kCream,
      colorScheme: const ColorScheme.light(
        primary: kOrange,
        onPrimary: Colors.white,
        secondary: kBlack,
        onSecondary: Colors.white,
        surface: kCardLight,
        onSurface: kTextPrimary,
      ),
      textTheme: GoogleFonts.dmSansTextTheme().apply(
        bodyColor: kTextPrimary,
        displayColor: kTextPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kBlack),
        scrolledUnderElevation: 0,
      ),
    );
  }
}
