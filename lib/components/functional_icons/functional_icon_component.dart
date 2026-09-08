import 'package:flutter/material.dart';
import 'functional_icon_view_model.dart';

class FunctionalIconComponent extends StatelessWidget {
  final FunctionalIconViewModel viewModel;

  const FunctionalIconComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (viewModel.type) {
      case FunctionalIconType.categoryPrimary:
        return IconButton(
          onPressed: viewModel.enabled ? viewModel.onTap : null,
          icon: const Icon(Icons.grid_view_rounded),
        );

      case FunctionalIconType.categorySecondary:
        return IconButton(
          onPressed: viewModel.enabled ? viewModel.onTap : null,
          icon: const Icon(Icons.list_rounded),
        );

      case FunctionalIconType.loadingCheck:
        return Icon(
          Icons.check_circle,
          color: colorScheme.primary,
        );

      case FunctionalIconType.loadingError:
        return Icon(
          Icons.error,
          color: colorScheme.error,
        );

      case FunctionalIconType.navigation:
        return IconButton(
          onPressed: viewModel.enabled ? viewModel.onTap : null,
          icon: Icon(
            Icons.home_outlined,
            color: viewModel.active
                ? colorScheme.primary
                : colorScheme.onSurface,
          ),
        );

      case FunctionalIconType.checkbox:
        return Checkbox(
          value: viewModel.active,
          onChanged: viewModel.enabled
              ? (_) => viewModel.onTap?.call()
              : null,
        );

      case FunctionalIconType.radio:
        return Radio<bool>(
          value: true,
          groupValue: viewModel.active,
          onChanged: viewModel.enabled
              ? (_) => viewModel.onTap?.call()
              : null,
        );

      case FunctionalIconType.eyesPass:
        return IconButton(
          onPressed: viewModel.enabled ? viewModel.onTap : null,
          icon: Icon(
            viewModel.obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        );

      case FunctionalIconType.toggle:
        return Switch(
          value: viewModel.active,
          onChanged: viewModel.enabled
              ? (_) => viewModel.onTap?.call()
              : null,
        );

      case FunctionalIconType.calendar:
        return IconButton(
          onPressed: viewModel.enabled ? viewModel.onTap : null,
          icon: const Icon(Icons.calendar_month_outlined),
        );
    }
  }
}