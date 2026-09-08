import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.lettersIcons,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 22 / 20,
    color: AppColors.lettersIcons,
  );

  static const TextStyle paragraph = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: AppColors.darkModeBlack,
  );
}