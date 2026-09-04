import 'package:flutter/material.dart';
import '../components/action_button/action_button_view_model.dart';
import '../components/action_button/action_button_factory.dart';
import 'sample_action_button_screen.dart';
import 'sample_period_switch_screen.dart';
import 'sample_category_icon_screen.dart';
import 'sample_nav_icon_screen.dart';
import 'sample_dropdown_screen.dart';
import 'sample_accordion_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.onToggleTheme});

  static final Map<String, Widget Function()> _menuItems = {
    'Buttons': () => const SampleActionButtonScreen(),
    'Period Switch': () => const SamplePeriodSwitchScreen(),
    'Category Icons': () => const SampleCategoryIconScreen(),
    'Nav Icons': () => const SampleNavIconScreen(),
    'Dropdown': () => const SampleDropdownScreen(),
    'Accordion & Dialogs': () => const SampleAccordionScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Componentes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._menuItems.entries.map((entry) {
            final viewModel = ActionButtonViewModel(
              label: entry.key,
              variant: ActionButtonVariant.activate,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => entry.value()),
                );
              },
            );
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ActionButtonFactory.create(viewModel),
            );
          }),
        ],
      ),
    );
  }
}