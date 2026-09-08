import 'package:flutter/material.dart';
import 'additional_element_view_model.dart';

class AdditionalElementComponent extends StatelessWidget {
  final AdditionalElementViewModel viewModel;

  const AdditionalElementComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewModel.type) {
      case AdditionalElementType.input:
        return TextField(
          obscureText: viewModel.obscureText,
          keyboardType: viewModel.keyboardType,
          onChanged: viewModel.onChanged,
          decoration: InputDecoration(
            labelText: viewModel.label,
            hintText: viewModel.hint,
            border: const OutlineInputBorder(),
          ),
        );

      case AdditionalElementType.floatLabel:
        return TextField(
          obscureText: viewModel.obscureText,
          keyboardType: viewModel.keyboardType,
          onChanged: viewModel.onChanged,
          decoration: InputDecoration(
            labelText: viewModel.label,
            hintText: viewModel.hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
        );
    }
  }
}