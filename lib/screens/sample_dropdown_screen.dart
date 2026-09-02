import 'package:flutter/material.dart';
import '../components/dropdown/dropdown_view_model.dart';
import '../components/dropdown/dropdown_factory.dart';

class SampleDropdownScreen extends StatefulWidget {
  const SampleDropdownScreen({super.key});

  @override
  State<SampleDropdownScreen> createState() => _SampleDropdownScreenState();
}

class _SampleDropdownScreenState extends State<SampleDropdownScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = DropdownViewModel(
      options: const ['Este mês', 'Mês passado', 'Este ano'],
      selectedIndex: _selected,
      onOptionSelected: (i) => setState(() => _selected = i),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Dropdown')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: DropdownFactory.create(viewModel),
      ),
    );
  }
}