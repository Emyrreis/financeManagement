import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'switch_toggle_view_model.dart';

class SwitchToggleComponent extends StatelessWidget {
  final SwitchToggleViewModel viewModel;

  const SwitchToggleComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(viewModel.options.length, (index) {
          final isSelected = index == viewModel.selectedIndex;
          return Expanded(
            child: GestureDetector(
              //delegate o componente apenas notifica, quem decide o que fazer com a seleção é quem criou o viewmodel.
              onTap: () => viewModel.onOptionSelected(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                height: 51,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.mainGreen
                      : AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  viewModel.options[index],
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 15),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}