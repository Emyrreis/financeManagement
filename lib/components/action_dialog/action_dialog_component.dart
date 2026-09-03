import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'action_dialog_view_model.dart';

class ActionDialogComponent extends StatelessWidget {
  final ActionDialogViewModel viewModel;

  const ActionDialogComponent({super.key, required this.viewModel});

  Widget _buildBody() {
    if (viewModel.type == ActionDialogType.withInput) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 37,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(18),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write...',
            hintStyle: TextStyle(color: AppColors.mainGreen),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        viewModel.message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontFamily: 'LeagueSpartan', fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            viewModel.title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.darkModeBar,
            ),
          ),
          _buildBody(),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: viewModel.onConfirm, // Delegate
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(viewModel.primaryLabel),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: viewModel.onCancel, // Delegate
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightGreen,
                foregroundColor: AppColors.darkModeBar,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Text(viewModel.secondaryLabel),
            ),
          ),
        ],
      ),
    );
  }
}