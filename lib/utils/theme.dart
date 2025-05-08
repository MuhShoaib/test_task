import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static final ThemeData primaryTheme = ThemeData(
    hintColor: Colors.black,
    scaffoldBackgroundColor: AppColors.bgClr,
    fontFamily: 'Poppins',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionHandleColor: Colors.black,
    ),
    colorScheme: const ColorScheme.light(primary: AppColors.primaryClr),

    textTheme: const TextTheme(
      //label
      //body
      //headline
      labelSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),

      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    ),
  );
}
