import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../common/app_text_styles.dart';
import 'additional_element_view_model.dart';

class AdditionalElementComponent extends StatefulWidget {
  final AdditionalElementViewModel viewModel;

  const AdditionalElementComponent({
    super.key,
    required this.viewModel,
  });

  @override
  State<AdditionalElementComponent> createState() =>
      _AdditionalElementComponentState();
}

class _AdditionalElementComponentState
    extends State<AdditionalElementComponent> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.viewModel.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    switch (viewModel.type) {
      case AdditionalElementType.textField:
        return _field(
          label: viewModel.label,
          hint: viewModel.hint,
          initialValue: viewModel.initialValue,
          keyboardType: viewModel.keyboardType,
          onChanged: viewModel.onChanged,
        );

      case AdditionalElementType.passwordField:
        return _field(
          label: viewModel.label,
          hint: viewModel.hint,
          obscureText: _obscure,
          keyboardType: TextInputType.visiblePassword,
          onChanged: viewModel.onChanged,
          suffixIcon: IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
              size: 20,
              color: AppColors.lettersIcons,
            ),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
        );

      case AdditionalElementType.otpCode:
        final digits = (viewModel.initialValue ?? '000000')
            .padRight(6, '0')
            .split('')
            .take(6)
            .toList();
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (final digit in digits)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.mainGreen, width: 1.5),
                  ),
                  child: Text(digit, style: AppTextStyles.subtitle),
                ),
              ),
          ],
        );

      case AdditionalElementType.dateField:
        return _fieldShell(
          label: viewModel.label,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  viewModel.initialValue ?? '',
                  style: AppTextStyles.subtitle,
                ),
              ),
              Switch(
                value: viewModel.toggleValue,
                activeThumbColor: AppColors.mainGreen,
                onChanged: viewModel.onToggleChanged,
              ),
            ],
          ),
        );

      case AdditionalElementType.categoryDropdown:
        return _fieldShell(
          label: viewModel.label,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: viewModel.initialValue,
              icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.lettersIcons),
              style: AppTextStyles.subtitle,
              items: [
                for (final option in viewModel.options)
                  DropdownMenuItem(value: option, child: Text(option)),
              ],
              onChanged: (value) => viewModel.onChanged?.call(value ?? ''),
            ),
          ),
        );

      case AdditionalElementType.messageArea:
        return _field(
          label: null,
          hint: viewModel.hint,
          maxLines: 5,
          onChanged: viewModel.onChanged,
        );

      case AdditionalElementType.confirmEndSession:
        return _confirmCard(
          title: 'End Session',
          message: 'Are you sure you want to log out?',
          confirmLabel: viewModel.confirmLabel.isEmpty
              ? 'Yes, End Session'
              : viewModel.confirmLabel,
          cancelLabel: viewModel.cancelLabel,
          onConfirm: viewModel.onConfirm,
          onCancel: viewModel.onCancel,
        );

      case AdditionalElementType.newCategoryCard:
        return _newCategoryCard(
          hint: viewModel.hint ?? 'Write...',
          confirmLabel: viewModel.confirmLabel.isEmpty ? 'Save' : viewModel.confirmLabel,
          cancelLabel: viewModel.cancelLabel,
          onChanged: viewModel.onChanged,
          onConfirm: viewModel.onConfirm,
          onCancel: viewModel.onCancel,
        );

      case AdditionalElementType.confirmDeleteAccount:
        return _confirmCard(
          title: 'Delete Account',
          message: 'Are You Sure You Want To Log Out?',
          detail:
          'By deleting your account, you agree that you understand the '
              'consequences of this action and that you agree to permanently '
              'delete your account and all associated data.',
          confirmLabel: viewModel.confirmLabel.isEmpty
              ? 'Yes, Delete Account'
              : viewModel.confirmLabel,
          cancelLabel: viewModel.cancelLabel,
          onConfirm: viewModel.onConfirm,
          onCancel: viewModel.onCancel,
        );
    }
  }

  Widget _field({
    required String? label,
    String? hint,
    String? initialValue,
    bool obscureText = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: AppTextStyles.subtitle,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.mainGreen),
        filled: true,
        fillColor: AppColors.lightGreen,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _fieldShell({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.paragraph),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _confirmCard({
    required String title,
    required String message,
    String? detail,
    required String confirmLabel,
    required String cancelLabel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.title, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(message, style: AppTextStyles.paragraph, textAlign: TextAlign.center),
          if (detail != null) ...[
            const SizedBox(height: 8),
            Text(detail, style: AppTextStyles.paragraph, textAlign: TextAlign.center),
          ],
          const SizedBox(height: 16),
          _dialogButton(confirmLabel, filled: true, onTap: onConfirm),
          const SizedBox(height: 8),
          _dialogButton(cancelLabel, filled: false, onTap: onCancel),
        ],
      ),
    );
  }

  Widget _newCategoryCard({
    required String hint,
    required String confirmLabel,
    required String cancelLabel,
    ValueChanged<String>? onChanged,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text('New Category', style: AppTextStyles.title, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          _field(label: null, hint: hint, onChanged: onChanged),
          const SizedBox(height: 12),
          _dialogButton(confirmLabel, filled: true, onTap: onConfirm),
          const SizedBox(height: 8),
          _dialogButton(cancelLabel, filled: false, onTap: onCancel),
        ],
      ),
    );
  }

  Widget _dialogButton(String label, {required bool filled, VoidCallback? onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onTap ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? AppColors.mainGreen : AppColors.lightGreen,
          foregroundColor: AppColors.lettersIcons,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
