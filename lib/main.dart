import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ))),
          dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey, // Define your desired border color
                  width: 1.0, // Define your desired border width
                ),
                borderRadius: BorderRadius.circular(
                    20), // Define your desired border radius
              ),
            ),
          ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
