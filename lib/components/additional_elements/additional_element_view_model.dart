import 'package:flutter/material.dart';

enum AdditionalElementType {
  textField,
  passwordField,
  otpCode,
  dateField,
  categoryDropdown,
  messageArea,
  confirmEndSession,
  newCategoryCard,
  confirmDeleteAccount,
}

class AdditionalElementViewModel {
  final AdditionalElementType type;
  final String label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  final bool toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  final List<String> options;

  final String confirmLabel;
  final String cancelLabel;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const AdditionalElementViewModel({
    required this.type,
    this.label = '',
    this.hint,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.toggleValue = false,
    this.onToggleChanged,
    this.options = const [],
    this.confirmLabel = '',
    this.cancelLabel = 'Cancel',
    this.onConfirm,
    this.onCancel,
  });
}
