import 'package:flutter/material.dart';

class AppTheme {
  static const TextTheme textTheme = TextTheme(
    titleSmall: title,
    bodyMedium: body,
    bodySmall: caption, 
    titleLarge: titleLarge
  );

  static const fontName = 'Roboto';
  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
  
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );
  static const TextStyle body = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 14
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );

  ThemeData getTheme() => ThemeData(
      fontFamily: fontName,
      primaryTextTheme: textTheme,
      useMaterial3: true,
      colorSchemeSeed: Colors.blueAccent,
      appBarTheme: const AppBarTheme(centerTitle: false));
}
