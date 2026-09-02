// lib/screens/sample_nav_icon_screen.dart
import 'package:flutter/material.dart';
import '../components/nav_icon/nav_icon_view_model.dart';
import '../components/nav_icon/nav_icon_component.dart';

class SampleNavIconScreen extends StatefulWidget {
  const SampleNavIconScreen({super.key});

  @override
  State<SampleNavIconScreen> createState() => _SampleNavIconScreenState();
}

class _SampleNavIconScreenState extends State<SampleNavIconScreen> {
  NavItemType _active = NavItemType.home;

  static const _icons = {
    NavItemType.home: Icons.home,
    NavItemType.analysis: Icons.bar_chart,
    NavItemType.transactions: Icons.swap_horiz,
    NavItemType.category: Icons.category,
    NavItemType.profile: Icons.person,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample: Nav Icons')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: NavItemType.values.map((type) {
            final viewModel = NavIconViewModel(
              type: type,
              isActive: _active == type,
              onSelected: () => setState(() => _active = type),
            );
            return NavIconComponent(viewModel: viewModel, icon: _icons[type]!);
          }).toList(),
        ),
      ),
    );
  }
}