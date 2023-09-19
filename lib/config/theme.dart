import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primaryColorSwatch =
      MaterialColor(0xFF22A87B, <int, Color>{
    50: Color(0xFF98EACE),
    100: Color(0xFF87E7C6),
    200: Color(0xFF65E0B6),
    300: Color(0xFF43D9A6),
    400: Color(0xFF29CA94),
    500: Color(0xFF22A87B),
    600: Color(0xFF197959),
    700: Color(0xFF0F4B37),
    800: Color(0xFF061C15),
    900: Color(0xFF000000),
  });

  static const Color primaryColor = Color(0xFF22A87B);
  static const Color secondaryColor = Color(0xFF2EA4CA);
  static const Color iconColor = Color(0xFF90A59E);

  static const String fontFamily = 'Inter';

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: primaryColorSwatch,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: Color(0xFFEFEFEF),
        elevation: 0,
        iconTheme: IconThemeData(
          color: iconColor,
        ),
        titleTextStyle: TextStyle(
            color: Color(0xFF656565),
            fontSize: 24,
            fontWeight: FontWeight.w600),
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: Color(0xFFFFFFFF),
        background: Color(0xFFEFEFEF),
      ),
      scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      iconTheme: const IconThemeData(
        color: iconColor,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Color(0xFF808080),
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF808080),
        ),
        titleMedium: TextStyle(
          color: Color(0xFF1F1F1F),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: Color(0xFFA7A7A7),
          dividerColor: primaryColor,
          indicatorColor: primaryColor));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: primaryColorSwatch,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: Color(0xFF282828),
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white54),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Color(0xFF282828),
          background: Color(0xFF3F3F3F)),
      cardTheme: const CardTheme(
        color: Color(0xFF282828),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xDDFFFFFF),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Color(0xDDFFFFFF),
        ),
        bodyMedium: TextStyle(
          color: Color(0xDDFFFFFF),
        ),
        titleMedium: TextStyle(
          color: Color(0xDDFFFFFF),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xFF282828),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xFF282828),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF282828),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF282828),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFDCDCDC),
          ),
        ),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: Color(0xDDFFFFFF),
          dividerColor: primaryColor,
          indicatorColor: primaryColor));
}
