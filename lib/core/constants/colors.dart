import 'package:flutter/material.dart';

class AppColor {
  /// App primary color
  static const Color primary = Color(0xff746a01);

  /// App secondary color
  static const Color secondary = Color(0xff3f6aa2);

  /// App black color
  static const Color black = Color(0xff141414);

  /// App white color
  static const Color white = Color(0xffffffff);

  ///[MaterialColor] from a [Color] object
  static MaterialColor getMaterialColor(Color color) {
    final List<double> strengths = <double>[.05];

    final swatch = <int, Color>{};
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    }

    return MaterialColor(color.value, swatch);
  }
}
