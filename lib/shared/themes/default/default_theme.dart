import 'package:flutter/material.dart';

import 'default_fonts_style.dart';
import 'default_pallete.dart';

export 'default_fonts_style.dart';
export 'default_pallete.dart';

class DefaultTheme {
  ThemeData get getTheme => defaultTheme();

  ThemeData defaultTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: PalleteColor.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: PalleteColor.mainColor,
        titleTextStyle: DefaultFontStyle.headingXSmall.getText.copyWith(
          color: PalleteColor.white,
        ),
      ),
    );
  }
}
