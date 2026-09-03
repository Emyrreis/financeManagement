import 'package:flutter/material.dart';
import 'action_dialog_view_model.dart';
import 'action_dialog_component.dart';

class ActionDialogFactory {
  ActionDialogFactory._();
  static Widget create(ActionDialogViewModel viewModel) =>
      ActionDialogComponent(viewModel: viewModel);
}