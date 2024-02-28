import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
  //main font
  fontFamily: 'OfficinaSansStd',
  //app bar
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    iconTheme: IconThemeData(
      color: AppColor.white,
    ),
  ),
  //floating action button
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: AppColor.primaryColor,
  ),
  //colors
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
  ),
  useMaterial3: true,
  //text
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColor.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    displayMedium: const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    displayLarge: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    headlineLarge: const TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  //main font
  fontFamily: 'Cairo',
  //app bar
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor,
    iconTheme: IconThemeData(
      color: AppColor.white,
    ),
  ),
  //colors
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
  ),
  useMaterial3: true,
  //text
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColor.grey,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    displayMedium: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    displayLarge: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    headlineLarge: const TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
  ),
);
