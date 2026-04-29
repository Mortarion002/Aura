import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle get displayHours => GoogleFonts.orbitron(
    fontSize: 120,
    fontWeight: FontWeight.w600,
    color: kBlack,
    height: 0.9,
    letterSpacing: 0,
  );

  static TextStyle get displayMinutes => GoogleFonts.orbitron(
    fontSize: 120,
    fontWeight: FontWeight.w600,
    color: kBlack,
    height: 0.9,
    letterSpacing: 0,
  );

  static TextStyle get displaySeconds => GoogleFonts.orbitron(
    fontSize: 120,
    fontWeight: FontWeight.w600,
    color: kBlack,
    height: 0.9,
    letterSpacing: 0,
  );

  static TextStyle get heroTemperature => GoogleFonts.orbitron(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: kBlack,
    height: 0.95,
    letterSpacing: 0,
  );

  static TextStyle get heroLocation => GoogleFonts.dmSans(
    fontSize: 58,
    fontWeight: FontWeight.w400,
    color: kBlack,
    height: 1.05,
    letterSpacing: 0,
  );

  static TextStyle get displayUnit => GoogleFonts.michroma(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: kTextPrimary,
  );

  static TextStyle get cardCity => GoogleFonts.michroma(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kBlack,
    letterSpacing: 0,
  );

  static TextStyle get cardUtc => GoogleFonts.michroma(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: kTextSecond,
    letterSpacing: 0,
  );

  static TextStyle get cardTime => GoogleFonts.orbitron(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: kBlack,
    letterSpacing: 0,
  );

  static TextStyle get labelSmall => GoogleFonts.michroma(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: kTextPrimary,
  );
}
