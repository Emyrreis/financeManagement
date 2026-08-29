import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'action_button_view_model.dart';

class ActionButtonComponent extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButtonComponent({super.key, required this.viewModel});

  bool get _isActivate => viewModel.variant == ActionButtonVariant.activate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 207,
      child: ElevatedButton(
        //dlegate: o clique é repassado para o viewmodel, o componente não decide o que acontece
        onPressed: viewModel.isEnabled ? viewModel.onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          _isActivate ? AppColors.mainGreen : AppColors.lightGreen,
          foregroundColor:
          _isActivate ? AppColors.darkModeBar : AppColors.lettersIcons,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          viewModel.label,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
        ),
      ),
    );
  }
}