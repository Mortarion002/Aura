import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Display — Clean Sans-serif
  static TextStyle get displayHours => GoogleFonts.manrope(
        fontSize: 180,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -6,
      );

  static TextStyle get displayMinutes => GoogleFonts.manrope(
        fontSize: 180,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -6,
      );

  static TextStyle get displaySeconds => GoogleFonts.manrope(
        fontSize: 180,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -6,
      );

  static TextStyle get displayUnit => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        letterSpacing: 2.0,
        color: kTextPrimary,
      );

  // Cards
  static TextStyle get cardCity => GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kTextPrimary,
      );

  static TextStyle get cardUtc => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: kTextSecond,
      );

  static TextStyle get cardTime => GoogleFonts.barlowCondensed(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: kTextPrimary,
      );

  // Labels
  static TextStyle get labelSmall => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        letterSpacing: 1.5,
        color: kTextPrimary,
      );
}
