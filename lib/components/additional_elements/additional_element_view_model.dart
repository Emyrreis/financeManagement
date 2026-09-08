import 'package:flutter/material.dart';

enum AdditionalElementType {
  input,
  floatLabel,
}

class AdditionalElementViewModel {
  final AdditionalElementType type;
  final String label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const AdditionalElementViewModel({
    required this.type,
    required this.label,
    this.hint,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });
}