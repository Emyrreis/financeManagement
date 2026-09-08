import 'package:flutter/material.dart';
import 'button_view_model.dart';

class ButtonComponent extends StatelessWidget {
  final ButtonViewModel viewModel;

  const ButtonComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    switch (viewModel.type) {
      case ButtonType.login:
      case ButtonType.signUp:
        return SizedBox(
          width: 207,
          height: 45,
          child: ElevatedButton(
            onPressed:
            viewModel.enabled ? viewModel.onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: Text(viewModel.label),
          ),
        );

      case ButtonType.navigationBar:
        return NavigationBar(
          selectedIndex: viewModel.active ? 1 : 0,
          onDestinationSelected: (_) => viewModel.onPressed?.call(),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        );

      case ButtonType.menuSwitch:
        return Switch(
          value: viewModel.active,
          onChanged: viewModel.enabled
              ? (_) => viewModel.onPressed?.call()
              : null,
        );
    }
  }
}