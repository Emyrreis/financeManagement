import 'package:flutter/material.dart';
import 'action_dialog_view_model.dart';

class ActionDialogComponent extends StatelessWidget {
  final ActionDialogViewModel viewModel;

  const ActionDialogComponent({super.key, required this.viewModel});

  Widget _buildBody(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (viewModel.type == ActionDialogType.withInput) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 37,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(18),
        ),
        child: TextField(
          style: TextStyle(color: colors.onSurface),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write...',
            hintStyle: TextStyle(color: colors.primary),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        viewModel.message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: 15,
          color: colors.onSurface,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            viewModel.title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colors.onSurface,
            ),
          ),
          _buildBody(context),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: viewModel.onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary, // <- texto do botão "Save" agora explícito
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
              onPressed: viewModel.onCancel,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.surface,
                foregroundColor: colors.onSurface,
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