import 'package:flutter/material.dart';
import '../components/additional_elements/additional_element_factory.dart';
import '../components/additional_elements/additional_element_view_model.dart';

class AdditionalElementsScreen extends StatelessWidget {
  const AdditionalElementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elementos Adicionais'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AdditionalElementFactory.create(
            const AdditionalElementViewModel(
              type: AdditionalElementType.input,
              label: 'Email',
              hint: 'Digite seu email',
            ),
          ),

          const SizedBox(height: 24),

          AdditionalElementFactory.create(
            const AdditionalElementViewModel(
              type: AdditionalElementType.input,
              label: 'Senha',
              obscureText: true,
            ),
          ),

          const SizedBox(height: 24),

          AdditionalElementFactory.create(
            const AdditionalElementViewModel(
              type: AdditionalElementType.floatLabel,
              label: 'Nome',
              hint: 'Digite seu nome',
            ),
          ),
        ],
      ),
    );
  }
}