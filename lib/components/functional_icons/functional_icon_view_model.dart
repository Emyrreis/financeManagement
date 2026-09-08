import 'package:flutter/material.dart';

enum FunctionalIconType {
  categoryPrimary,
  categorySecondary,
  loadingCheck,
  loadingError,
  navigation,
  checkbox,
  radio,
  eyesPass,
  toggle,
  calendar,
}

class FunctionalIconViewModel {
  final FunctionalIconType type;
  final bool active;
  final bool obscureText;
  final bool enabled;
  final VoidCallback? onTap;

  const FunctionalIconViewModel({
    required this.type,
    this.active = false,
    this.obscureText = true,
    this.enabled = true,
    this.onTap,
  });
}