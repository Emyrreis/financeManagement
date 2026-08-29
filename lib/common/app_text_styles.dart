import 'package:flutter/material.dart';
import 'app_colors.dart';

//estilos de texto
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500, //médio
    fontSize: 15,
    color: AppColors.lettersIcons,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, //semibold
    fontSize: 20,
    height: 22 / 20,
    color: AppColors.lettersIcons,
  );

  static const TextStyle paragraph = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300, //light
    fontSize: 13,
    color: AppColors.darkModeBlack,
  );
}