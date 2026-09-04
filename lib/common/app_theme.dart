import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.mainGreen,
      onPrimary: AppColors.lettersIcons, // texto escuro sobre botão verde, igual ao Figma
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
    ),
    useMaterial3: true,
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.mainGreen,
      onPrimary: AppColors.lettersIcons, // mesmo texto escuro, mesmo no dark mode (confirmado no Figma)
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
    ),
    useMaterial3: true,
  );
}