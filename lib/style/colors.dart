import 'package:flutter/material.dart';

final Color blue = HexColor('146bae');
final Color yellow = HexColor('ffca39');
final Color grey = HexColor('221e1f');
final Color red = HexColor('d9374e');
final Color white = HexColor('eaebed');

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
