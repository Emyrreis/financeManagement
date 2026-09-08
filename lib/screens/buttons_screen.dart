import 'package:flutter/material.dart';
import '../components/buttons/button_factory.dart';
import '../components/buttons/button_view_model.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ButtonFactory.create(
            ButtonViewModel(
              type: ButtonType.login,
              label: 'Log In',
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 16),

          ButtonFactory.create(
            ButtonViewModel(
              type: ButtonType.signUp,
              label: 'Sign Up',
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 32),

          ButtonFactory.create(
            ButtonViewModel(
              type: ButtonType.navigationBar,
              active: true,
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              const Expanded(
                child: Text('Menu Switch On / Off'),
              ),
              ButtonFactory.create(
                ButtonViewModel(
                  type: ButtonType.menuSwitch,
                  active: _active,
                  onPressed: () {
                    setState(() => _active = !_active);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}