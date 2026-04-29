import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Clock screen — drum digits
  static TextStyle drumDigit({double size = 118, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1.0,
        letterSpacing: -0.02 * size,
      );

  // Clock screen — seconds column
  static TextStyle seconds({double size = 36, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: color,
        height: 1.0,
        fontFeatures: [const FontFeature.tabularFigures()],
      );

  // Clock screen — city name hero
  static TextStyle cityHero({double size = 46, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1.05,
        letterSpacing: -0.02 * size,
      );

  // Clock screen — date text
  static TextStyle dateLabel({double size = 20, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.25,
      );

  // Weather — temperature hero
  static TextStyle heroTemperature({double size = 72, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: color,
        height: 0.85,
        letterSpacing: -0.04 * size,
      );

  // World clock & timer — card time
  static TextStyle cardTime({double size = 30, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: color,
        height: 1.0,
        letterSpacing: -0.01 * size,
      );

  // Card labels (city name, section headers)
  static TextStyle cardCity({double size = 14, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Small muted labels (UTC, dim text)
  static TextStyle cardUtc({double size = 11, Color color = kDim}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Toggle / pill labels
  static TextStyle labelSmall({double size = 13, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Timer center display
  static TextStyle timerDisplay({double size = 30, Color color = kBlack}) =>
      GoogleFonts.outfit(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: color,
        letterSpacing: -1,
      );

  // Legacy getters — kept so un-migrated widgets don't break
  static TextStyle get displayHours => drumDigit();
  static TextStyle get displayMinutes => drumDigit();
  static TextStyle get displaySeconds => drumDigit();
  static TextStyle get heroLocation => cityHero();
  static TextStyle get displayUnit => labelSmall();
}
