// lib/themes/light_theme.dart
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // ignore: prefer_const_constructors
  colorScheme: ColorScheme.light(
    primary: const Color.fromARGB(255, 1, 159, 174), // Main primary color

    secondary: const Color.fromARGB(255, 255, 6, 122), // Secondary color
    onSecondary: Colors.white, // Text color on secondary color
    // Text color on surface
    error: Colors.red, // Color to use for error states
    // Text color on tertiary color
  ),
  primaryColor: const Color.fromARGB(255, 1, 159, 174),
  primaryColorLight: const Color.fromARGB(255, 1, 159, 174).withOpacity(0.7),
  scaffoldBackgroundColor: Colors.grey.shade300,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 1, 159, 174),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 1, 159, 174),
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.25,
    ),
    headlineSmall: TextStyle(
      color: Color.fromARGB(255, 255, 6, 122),
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 1, 159, 174),
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
    ),
    labelLarge: TextStyle(
      color: Color.fromARGB(255, 255, 6, 122),
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 255, 6, 122), // Button color
    textTheme: ButtonTextTheme.primary, // Text theme for buttons
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 1, 159, 174), // Icon color
  ),
);
