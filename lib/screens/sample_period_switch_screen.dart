import 'package:flutter/material.dart';
import '../components/switch_toggle/switch_toggle_view_model.dart';
import '../components/switch_toggle/switch_toggle_factory.dart';

class SamplePeriodSwitchScreen extends StatefulWidget {
  const SamplePeriodSwitchScreen({super.key});

  @override
  State<SamplePeriodSwitchScreen> createState() =>
      _SamplePeriodSwitchScreenState();
}

class _SamplePeriodSwitchScreenState extends State<SamplePeriodSwitchScreen> {
  int _selectedPeriod = 0; // <- essa variável precisa existir na classe State

  @override
  Widget build(BuildContext context) {
    final periodViewModel = SwitchToggleViewModel(
      options: const ['Daily', 'Weekly', 'Monthly', 'Year'],
      selectedIndex: _selectedPeriod,
      onOptionSelected: (i) => setState(() => _selectedPeriod = i),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Period Switch')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SwitchToggleFactory.create(periodViewModel),
      ),
    );
  }
}