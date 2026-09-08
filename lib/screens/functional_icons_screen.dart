import 'package:flutter/material.dart';
import '../components/functional_icons/functional_icon_factory.dart';
import '../components/functional_icons/functional_icon_view_model.dart';

class FunctionalIconsScreen extends StatelessWidget {
  const FunctionalIconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Functional Icons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _item(
            'Categories Menu | Primary',
            FunctionalIconType.categoryPrimary,
          ),
          _item(
            'Categories Menu | Secondary',
            FunctionalIconType.categorySecondary,
          ),
          _item(
            'Loading Animation | Check',
            FunctionalIconType.loadingCheck,
          ),
          _item(
            'Loading Animation | Error',
            FunctionalIconType.loadingError,
          ),
          _item(
            'Navigation Menu',
            FunctionalIconType.navigation,
          ),
          _item(
            'Checkbox',
            FunctionalIconType.checkbox,
          ),
          _item(
            'Radio',
            FunctionalIconType.radio,
          ),
          _item(
            'Eyes-Pass',
            FunctionalIconType.eyesPass,
          ),
          _item(
            'Toggle Switch',
            FunctionalIconType.toggle,
          ),
          _item(
            'Calendar',
            FunctionalIconType.calendar,
          ),
        ],
      ),
    );
  }

  Widget _item(String title, FunctionalIconType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 220,
            child: Text(title),
          ),
          FunctionalIconFactory.create(
            FunctionalIconViewModel(
              type: type,
            ),
          ),
        ],
      ),
    );
  }
}