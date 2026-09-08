import 'package:flutter/material.dart';
import 'functional_icon_component.dart';
import 'functional_icon_view_model.dart';

class FunctionalIconFactory {
  FunctionalIconFactory._();

  static Widget create(FunctionalIconViewModel viewModel) {
    return FunctionalIconComponent(viewModel: viewModel);
  }
}