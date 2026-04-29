import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Display — Clean Sans-serif
  // Display — Tech / Square
  static TextStyle get displayHours => GoogleFonts.orbitron(
        fontSize: 120,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -2,
      );

  static TextStyle get displayMinutes => GoogleFonts.orbitron(
        fontSize: 120,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -2,
      );

  static TextStyle get displaySeconds => GoogleFonts.orbitron(
        fontSize: 120,
        fontWeight: FontWeight.w600,
        color: kBlack,
        height: 0.9,
        letterSpacing: -2,
      );

  static TextStyle get displayUnit => GoogleFonts.michroma(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        letterSpacing: 2.0,
        color: kTextPrimary,
      );

  // Cards
  static TextStyle get cardCity => GoogleFonts.michroma(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: kBlack,
      );

  static TextStyle get cardUtc => GoogleFonts.michroma(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: kTextSecond,
      );

  static TextStyle get cardTime => GoogleFonts.orbitron(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: kBlack,
      );

  // Labels
  static TextStyle get labelSmall => GoogleFonts.michroma(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: kTextPrimary,
      );
}
