import 'package:flutter/material.dart';

class ColorUtils {
  static const Color PRIMARY_BD_BTN_DARK_COLOR = const Color(0xFF182559);
  static const Color BG_COLOR= Color(0xFFE5E5E5);
  static const Color BACKGROUND_COLOR= const Color(0xFFF4F6FE);
  static const Color PRIMARY_COLOR = const Color(0xFF030E3B);
  static const Color SECONDARY_COLOR = const Color(0xFFF2BA43);
  static const Color PLACEHOLDER_COLOR = const Color(0xFF37474F);
  static const Color BORDER_COLOR = const Color(0xFFDADADA);
  static const Color WHITE_COLOR = const Color(0xFFFFFFFF);
  static const Color PRIMARY_BG_TEXT_COLOR = const Color(0xFF9EA6C7);
  static const Color WHITE_BG_TEXT_COLOR = const Color(0xFF77869E);
  static const Color WHITE_BG_TEXT_COLOR2 = const Color(0xFF042C5C);
  }
class HexColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}