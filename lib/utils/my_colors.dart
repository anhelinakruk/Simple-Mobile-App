import 'dart:ui';

class MyColors {
  static final blackColor = HexColor('OEOEOE');
  static final whiteColor = HexColor('FFFFFF');
  static final purpleColor = HexColor('9747FF');
  static const transparentBlack = Color.fromRGBO(0, 0, 0, 0.3);
  static final darkPurpleColor = HexColor('471AA0');
  static final lightPurpleColor = HexColor('BB84E8');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var colorString = hexColor.toUpperCase().replaceAll('#', '');
    if (colorString.length == 6) {
      colorString = 'FF$colorString';
    }
    return int.parse(colorString, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}
