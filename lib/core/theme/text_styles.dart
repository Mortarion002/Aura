import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Display — Barlow Condensed ExtraBold
  static TextStyle get displayHours => GoogleFonts.barlowCondensed(
        fontSize: 160,
        fontWeight: FontWeight.w800,
        color: kBlack.withOpacity(0.15),
        height: 1.0,
      );

  static TextStyle get displayMinutes => GoogleFonts.barlowCondensed(
        fontSize: 160,
        fontWeight: FontWeight.w800,
        color: kBlack.withOpacity(0.45),
        height: 1.0,
      );

  static TextStyle get displaySeconds => GoogleFonts.barlowCondensed(
        fontSize: 160,
        fontWeight: FontWeight.w800,
        color: kBlack,
        height: 1.0,
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
