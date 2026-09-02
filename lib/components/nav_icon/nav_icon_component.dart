import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'nav_icon_view_model.dart';

class NavIconComponent extends StatelessWidget {
  final NavIconViewModel viewModel;
  final IconData icon;

  const NavIconComponent({super.key, required this.viewModel, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: viewModel.isActive ? AppColors.mainGreen : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: viewModel.isActive ? Colors.white : AppColors.lettersIcons,
        ),
      ),
    );
  }
}