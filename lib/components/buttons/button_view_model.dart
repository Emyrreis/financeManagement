import 'package:flutter/material.dart';

enum ButtonType {
  login,
  signUp,
  navigationBar,
  menuSwitch,
}

class ButtonViewModel {
  final ButtonType type;
  final String label;
  final bool active;
  final bool enabled;
  final VoidCallback? onPressed;

  const ButtonViewModel({
    required this.type,
    this.label = '',
    this.active = false,
    this.enabled = true,
    this.onPressed,
  });
}