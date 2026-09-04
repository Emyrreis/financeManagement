import 'package:flutter/material.dart';
import 'dropdown_view_model.dart';

class DropdownComponent extends StatelessWidget {
  final DropdownViewModel viewModel;

  const DropdownComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.primary.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: viewModel.selectedIndex,
          icon: Icon(Icons.keyboard_arrow_down, color: colors.onSurface),
          dropdownColor: colors.surface,
          style: TextStyle(color: colors.onSurface, fontFamily: 'Poppins'),
          items: List.generate(
            viewModel.options.length,
                (i) => DropdownMenuItem(value: i, child: Text(viewModel.options[i])),
          ),
          onChanged: (i) {
            if (i != null) viewModel.onOptionSelected(i);
          },
        ),
      ),
    );
  }
}