import 'package:flutter/material.dart';
import '../components/accordion/accordion_view_model.dart';
import '../components/accordion/accordion_factory.dart';
import '../components/action_dialog/action_dialog_view_model.dart';
import '../components/action_dialog/action_dialog_factory.dart';

class SampleAccordionScreen extends StatefulWidget {
  const SampleAccordionScreen({super.key});

  @override
  State<SampleAccordionScreen> createState() => _SampleAccordionScreenState();
}

class _SampleAccordionScreenState extends State<SampleAccordionScreen> {
  bool _isExpanded = false;

  void _showDialog(ActionDialogViewModel viewModel) {
    showDialog(
      context: context,
      builder: (_) => Dialog(child: ActionDialogFactory.create(viewModel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accordionViewModel = AccordionViewModel(
      question: 'How to use finWise?',
      answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      isExpanded: _isExpanded,
      onToggle: () => setState(() => _isExpanded = !_isExpanded),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Accordion & Dialogs')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccordionFactory.create(accordionViewModel),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _showDialog(ActionDialogViewModel(
                title: 'New Category',
                type: ActionDialogType.withInput,
                primaryLabel: 'Save',
                onConfirm: () => Navigator.pop(context),
                onCancel: () => Navigator.pop(context),
              )),
              child: const Text('Abrir: New Category'),
            ),
            ElevatedButton(
              onPressed: () => _showDialog(ActionDialogViewModel(
                title: 'Delete account',
                message: 'By deleting your account you agree this action is permanent.',
                primaryLabel: 'Yes, delete account',
                onConfirm: () => Navigator.pop(context),
                onCancel: () => Navigator.pop(context),
              )),
              child: const Text('Abrir: Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}