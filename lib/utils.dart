
import 'dart:ui';

String getValueOrEmpty(doc, key) {
  return doc != null ? doc[key] != null ? doc[key] : "" : "";
}

bool getValueOrFalse(doc, key) {
  return doc[key] != null ? doc[key] : false;
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
