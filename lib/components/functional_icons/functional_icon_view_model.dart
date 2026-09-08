import 'package:flutter/material.dart';

enum FunctionalIconType {
  categoryPrimary,
  categorySecondary,
  loadingCheck,
  loadingError,
  navigation,
  radio,
  checkbox,
  notificationBell,
  searchAction,
  calendarAction,
  cameraAction,
  micAction,
  sendAction,
  eyesPass,
  toggle,
  calendarDate,
}

class FunctionalIconViewModel {
  final FunctionalIconType type;

  final IconData? icon;

  final bool active;

  final String? dayLabel;

  final bool obscureText;
  final bool enabled;
  final VoidCallback? onTap;

  const FunctionalIconViewModel({
    required this.type,
    this.icon,
    this.active = false,
    this.dayLabel,
    this.obscureText = true,
    this.enabled = true,
    this.onTap,
  });
}
