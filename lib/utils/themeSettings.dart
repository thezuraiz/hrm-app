import 'package:flutter/material.dart';

ThemeData myCustomThemeData() {
  return ThemeData(
    colorScheme: ColorScheme(
      primary: Colors.blue,
      primaryContainer: Colors.blue[700]!,
      secondary: Colors.blueAccent,
      secondaryContainer: Colors.blueAccent[700]!,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      filled: true,
      fillColor: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
