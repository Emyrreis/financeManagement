import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'category_icon_view_model.dart';

class CategoryIconComponent extends StatelessWidget {
  final CategoryIconViewModel viewModel;
  final IconData icon;

  const CategoryIconComponent({
    super.key,
    required this.viewModel,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: viewModel.isPressed
              ? AppColors.oceanBlue
              : const Color(0xFF6DB6FE),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}