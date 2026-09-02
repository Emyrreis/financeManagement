import 'package:flutter/material.dart';
import '../components/category_icon/category_icon_view_model.dart';
import '../components/category_icon/category_icon_factory.dart';

class SampleCategoryIconScreen extends StatefulWidget {
  const SampleCategoryIconScreen({super.key});

  @override
  State<SampleCategoryIconScreen> createState() =>
      _SampleCategoryIconScreenState();
}

class _SampleCategoryIconScreenState extends State<SampleCategoryIconScreen> {
  CategoryType? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Category Icons')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: CategoryType.values.map((type) {
            final viewModel = CategoryIconViewModel(
              type: type,
              isPressed: _selected == type,
              onSelected: () => setState(() => _selected = type),
            );
            return CategoryIconFactory.create(viewModel);
          }).toList(),
        ),
      ),
    );
  }
}