import 'package:flutter/material.dart';
import 'functional_icons_screen.dart';
import 'buttons_screen.dart';
import 'additional_elements_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Management'),
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
          _menu(
            context,
            'Functional Icons',
            const FunctionalIconsScreen(),
          ),
          _menu(
            context,
            'Buttons',
            const ButtonsScreen(),
          ),
          _menu(
            context,
            'Elementos Adicionais',
            const AdditionalElementsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _menu(
      BuildContext context,
      String title,
      Widget screen,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => screen,
              ),
            );
          },
          child: Text(title),
        ),
      ),
    );
  }
}