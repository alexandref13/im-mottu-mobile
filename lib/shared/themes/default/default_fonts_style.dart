import 'package:flutter/material.dart';

enum DefaultFontStyle {
  headingDisplay,
  headingXLarge,
  headingLarge,
  headingMedium,
  headingSmall,
  headingXSmall,
  subtitleLarge,
  subtitleSmall,
  paragraphLarge,
  paragraphSmall,
  caption,
  captionSmall,
  button,
  logo,
  logoSmall
}

extension FontStyleExt on DefaultFontStyle {
  TextStyle get getText {
    switch (this) {
      case DefaultFontStyle.headingDisplay:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 96,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        );
      case DefaultFontStyle.headingXLarge:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 64,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        );
      case DefaultFontStyle.headingLarge:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 48,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        );
      case DefaultFontStyle.headingMedium:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        );
      case DefaultFontStyle.headingSmall:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        );
      case DefaultFontStyle.headingXSmall:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
        );
      case DefaultFontStyle.subtitleLarge:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 32,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
      case DefaultFontStyle.subtitleSmall:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
      case DefaultFontStyle.paragraphLarge:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
      case DefaultFontStyle.paragraphSmall:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
      case DefaultFontStyle.caption:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
      case DefaultFontStyle.captionSmall:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
      case DefaultFontStyle.button:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        );
      case DefaultFontStyle.logo:
        return const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        );
        case DefaultFontStyle.logoSmall:
        return const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        );
      default:
        return const TextStyle(
          fontFamily: 'Cabin',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
    }
  }
}
