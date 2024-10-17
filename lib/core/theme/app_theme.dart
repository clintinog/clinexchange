import 'package:clinexchange/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // This is for the light theme of the application
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    primaryColor: AppColor.primaryColor,
    primarySwatch: MaterialColor(AppColor.primaryColor.value, {
    50: AppColor.primaryColor.withOpacity(0.1),
    100: AppColor.primaryColor.withOpacity(0.2),
    200: AppColor.primaryColor.withOpacity(0.3),
    300: AppColor.primaryColor.withOpacity(0.4),
    400: AppColor.primaryColor.withOpacity(0.5),
    500: AppColor.primaryColor,
    600: AppColor.primaryColor.withOpacity(0.7),
    700: AppColor.primaryColor.withOpacity(0.8),
    800: AppColor.primaryColor.withOpacity(0.9),
    900: AppColor.primaryColor,
  }),
    scaffoldBackgroundColor: AppColor.lightBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        // borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        // borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      focusColor: AppColor.primaryColor,
      prefixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return AppColor.primaryColor;
        }
        return Colors.grey;
      }),
      labelStyle: const TextStyle(color: Colors.grey),
      floatingLabelStyle: const TextStyle(color: AppColor.primaryColor),
    ),
  );

  // This is for the dark theme of the application.
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    primaryColor: AppColor.primaryColor,
    primarySwatch: MaterialColor(AppColor.primaryColor.value, {
    50: AppColor.primaryColor.withOpacity(0.1),
    100: AppColor.primaryColor.withOpacity(0.2),
    200: AppColor.primaryColor.withOpacity(0.3),
    300: AppColor.primaryColor.withOpacity(0.4),
    400: AppColor.primaryColor.withOpacity(0.5),
    500: AppColor.primaryColor,
    600: AppColor.primaryColor.withOpacity(0.7),
    700: AppColor.primaryColor.withOpacity(0.8),
    800: AppColor.primaryColor.withOpacity(0.9),
    900: AppColor.primaryColor,
  }),
    scaffoldBackgroundColor: AppColor.darkBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
      inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        // borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        // borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      focusColor: AppColor.primaryColor,
      prefixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return AppColor.primaryColor;
        }
        return Colors.grey;
      }),
      labelStyle: const TextStyle(color: Colors.grey),
      floatingLabelStyle: const TextStyle(color: AppColor.primaryColor),
    ),
  );
}
