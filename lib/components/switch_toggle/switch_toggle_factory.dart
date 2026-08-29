import 'package:flutter/material.dart';
import 'switch_toggle_view_model.dart';
import 'switch_toggle_component.dart';

class SwitchToggleFactory {
  SwitchToggleFactory._();

  static Widget create(SwitchToggleViewModel viewModel) {
    return SwitchToggleComponent(viewModel: viewModel);
  }
}