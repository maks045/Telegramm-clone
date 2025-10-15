import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

///static - класстын ичинде туруп, объект түзбөй эле колдонуу дегенди билдирет.
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true, //жаңы жана кооз дизайн стилин колдон
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    // scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      // surface: AppColors.background,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.text),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.text),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
