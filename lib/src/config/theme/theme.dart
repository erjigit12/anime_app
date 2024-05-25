import 'package:flutter/material.dart';

// final themeData = ThemeData(
//   colorScheme: const ColorScheme.light(
//     background: Colors.white,
//     onBackground: Colors.black,
//     primary: Color.fromRGBO(206, 147, 216, 1),
//     onPrimary: Colors.black,
//     secondary: Color.fromRGBO(244, 143, 177, 1),
//     onSecondary: Colors.white,
//     tertiary: Color.fromRGBO(255, 204, 128, 1),
//     error: Colors.red,
//     outline: Color(0xFF424242),
//   ),
// );

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    primaryColor: Colors.white,
    shadowColor: Colors.black54,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        backgroundColor: Colors.black,
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark()
        .copyWith(secondary: Colors.grey.shade900)
        .copyWith(background: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white70,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    shadowColor: Colors.white54,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        backgroundColor: Colors.white,
        color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
      onBackground: Colors.black,
      primary: const Color.fromRGBO(206, 147, 216, 1),
      onPrimary: Colors.black,
      secondary: const Color.fromRGBO(244, 143, 177, 1),
      onSecondary: Colors.white,
      tertiary: const Color.fromRGBO(255, 204, 128, 1),
      error: Colors.red,
      outline: const Color(0xFF424242),
    ),
  );
}
