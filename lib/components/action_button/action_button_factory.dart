import 'package:flutter/material.dart';
import 'action_button_view_model.dart';
import 'action_button_component.dart';

//centraliza a criação do componente visual a partir do ViewModel.
class ActionButtonFactory {
  ActionButtonFactory._();

  static Widget create(ActionButtonViewModel viewModel) {
    return ActionButtonComponent(viewModel: viewModel);
  }
}