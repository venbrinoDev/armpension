
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_util.dart';



bool isLightTheme = true;
class CustomThemeData {
  static ThemeData getThemeData() {
    if (isLightTheme) {
      return _buildLightTheme();
    } else {
      return _buildDarkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      title: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: base.title?.color,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
      subhead: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.subhead?.color, fontSize: 16)),
      subtitle: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: base.subtitle?.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      body1: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.body1?.color, fontSize: 16)),
      body2: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.body2?.color, fontSize: 14)),
      button: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: base.button?.color,
              fontSize: 14,
              fontWeight: FontWeight.w600)),
      caption: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.caption?.color, fontSize: 12)),
      display1: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.display1?.color, fontSize: 34)),
      display2: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.display2?.color, fontSize: 48)),
      display3: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.display3?.color, fontSize: 60)),
      display4: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.display4?.color, fontSize: 96)),
      headline: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.headline?.color, fontSize: 24)),
      overline: GoogleFonts.roboto(
          textStyle: TextStyle(color: base.overline?.color, fontSize: 10)),
    );
  }

  static ThemeData _buildDarkTheme() {
    Color primaryColor = ColorUtils.PRIMARY_COLOR;
    final ThemeData base = ThemeData.dark();
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      accentColor: primaryColor,
      // canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF212121),
      // backgroundColor: const Color(0xFF202124),
      errorColor: const Color(0xFFB00020),
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ThemeData _buildLightTheme() {
    Color primaryColor = ColorUtils.PRIMARY_COLOR;;

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // cupertinoOverrideTheme: _buildCupertinoTheme(base.cupertinoOverrideTheme),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      // indicatorColor: Colors.white,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: primaryColor,
      // canvasColor: Colors.white,
      // scaffoldBackgroundColor: const Color(0xFFEFF1F4),
      backgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFB00020),
      cursorColor: primaryColor,
      typography: Typography(),
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8,
      margin: EdgeInsets.all(0),
    );
  }
}


