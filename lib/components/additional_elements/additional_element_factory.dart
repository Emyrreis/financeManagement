import 'package:flutter/material.dart';
import 'additional_element_component.dart';
import 'additional_element_view_model.dart';

class AdditionalElementFactory {
  AdditionalElementFactory._();

  static Widget create(AdditionalElementViewModel viewModel) {
    return AdditionalElementComponent(viewModel: viewModel);
  }
}