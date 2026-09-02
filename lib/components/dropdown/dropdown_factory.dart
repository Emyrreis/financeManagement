import 'package:flutter/material.dart';
import 'dropdown_view_model.dart';
import 'dropdown_component.dart';

class DropdownFactory {
  DropdownFactory._();
  static Widget create(DropdownViewModel viewModel) =>
      DropdownComponent(viewModel: viewModel);
}