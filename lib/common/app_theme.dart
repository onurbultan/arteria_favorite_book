import 'package:flutter/material.dart';
import 'package:arteriaapp/common/app_colors.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(backgroundColor: AppColors.gray3, errorColor: AppColors.red2),
        primaryColor: AppColors.blue0,
        dividerColor: AppColors.gray4,
        fontFamily: 'Ubuntu',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(foregroundColor: AppColors.blue0, backgroundColor: AppColors.blue0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w700),
              backgroundColor: AppColors.blue0,
              elevation: 0,
              shadowColor: Colors.transparent,
              minimumSize: const Size.fromHeight(58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: Colors.transparent),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                foregroundColor: AppColors.blue0,
                minimumSize: const Size.fromHeight(48.0))));
  }

  static ThemeData of(BuildContext context, {bool shadowThemeOnly = false}) {
    return Theme.of(context);
  }
}
