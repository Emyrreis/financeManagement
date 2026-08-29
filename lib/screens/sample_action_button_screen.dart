import 'package:flutter/material.dart';
import '../components/action_button/action_button_view_model.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/switch_toggle/switch_toggle_view_model.dart';
import '../components/switch_toggle/switch_toggle_factory.dart';

class SampleActionButtonScreen extends StatefulWidget {
  const SampleActionButtonScreen({super.key});

  @override
  State<SampleActionButtonScreen> createState() =>
      _SampleActionButtonScreenState();
}

class _SampleActionButtonScreenState extends State<SampleActionButtonScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final loginViewModel = ActionButtonViewModel(
      label: 'Log In',
      variant: ActionButtonVariant.activate,
      onPressed: () => debugPrint('Login pressionado'),
    );

    final inactiveViewModel = ActionButtonViewModel(
      label: 'Button',
      variant: ActionButtonVariant.inactive,
      onPressed: () => debugPrint('Button pressionado'),
    );

    final switchViewModel = SwitchToggleViewModel(
      options: const ['FAQ', 'Contact Us'],
      selectedIndex: _selectedTab,
      onOptionSelected: (index) => setState(() => _selectedTab = index),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Buttons')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Log in / Sign up'),
            const SizedBox(height: 12),
            ActionButtonFactory.create(loginViewModel),
            const SizedBox(height: 8),
            ActionButtonFactory.create(inactiveViewModel),
            const SizedBox(height: 32),
            const Text('Menu Switch On / Off'),
            const SizedBox(height: 12),
            SwitchToggleFactory.create(switchViewModel),
          ],
        ),
      ),
    );
  }
}