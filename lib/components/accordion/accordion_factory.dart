import 'package:flutter/material.dart';
import 'accordion_view_model.dart';
import 'accordion_component.dart';

class AccordionFactory {
  AccordionFactory._();
  static Widget create(AccordionViewModel viewModel) =>
      AccordionComponent(viewModel: viewModel);
}