import 'package:flutter/material.dart';
import '../components/action_button/action_button_view_model.dart';
import '../components/action_button/action_button_factory.dart';
import 'sample_action_button_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonsMenuViewModel = ActionButtonViewModel(
      label: 'Buttons',
      variant: ActionButtonVariant.activate,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SampleActionButtonScreen(),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sample App')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Componentes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ActionButtonFactory.create(buttonsMenuViewModel),
            // à medida que criar novos tipos de componente
            // (ex: ListViews, Cards), adiciona um novo item aqui.
          ],
        ),
      ),
    );
  }
}