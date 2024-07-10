import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color background = Color(0xFFf2f2f2);
  
  static const Color main2 = Color(0xFF021639);
  static const Color grey = Color(0xFF929292);
  static const Color button= Color(0xFF0c55e3);

  static const Color main = Color(0xFF021029);
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
