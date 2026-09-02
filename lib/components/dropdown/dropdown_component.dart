import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'dropdown_view_model.dart';

class DropdownComponent extends StatelessWidget {
  final DropdownViewModel viewModel;

  const DropdownComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhiteGreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGreen),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: viewModel.selectedIndex,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: List.generate(
            viewModel.options.length,
                (i) => DropdownMenuItem(value: i, child: Text(viewModel.options[i])),
          ),
          // Delegate: repassa a escolha pra quem criou o ViewModel
          onChanged: (i) {
            if (i != null) viewModel.onOptionSelected(i);
          },
        ),
      ),
    );
  }
}