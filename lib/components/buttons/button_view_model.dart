import 'package:flutter/material.dart';

enum ButtonType {
  login,
  signUp,
  navigationBar,
  segmentedSwitch,
  optionPill,
  incomeExpenseToggle,
  searchBar,
}

class ButtonViewModel {
  final ButtonType type;
  final String label;
  final bool active;
  final bool enabled;
  final VoidCallback? onPressed;

  final int activeIndex;
  final ValueChanged<int>? onIndexSelected;

  final List<String> segments;
  final int selectedSegment;
  final ValueChanged<int>? onSegmentSelected;

  final IconData? icon;
  final String? amount;

  const ButtonViewModel({
    required this.type,
    this.label = '',
    this.active = false,
    this.enabled = true,
    this.onPressed,
    this.activeIndex = -1,
    this.onIndexSelected,
    this.segments = const [],
    this.selectedSegment = 0,
    this.onSegmentSelected,
    this.icon,
    this.amount,
  });
}
