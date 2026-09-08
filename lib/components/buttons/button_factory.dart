import 'package:flutter/material.dart';
import 'button_component.dart';
import 'button_view_model.dart';

class ButtonFactory {
  ButtonFactory._();

  static Widget create(ButtonViewModel viewModel) {
    return ButtonComponent(viewModel: viewModel);
  }
}