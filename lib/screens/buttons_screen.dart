import 'package:flutter/material.dart';
import '../common/app_text_styles.dart';
import '../components/buttons/button_factory.dart';
import '../components/buttons/button_view_model.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  int _navIndex = 0;
  int _faqIndex = 0;
  int _periodIndex3 = 0;
  int _periodIndex4 = 0;
  int _categoryIndex = 0;
  bool _optionActive = false;
  bool _expenseSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _section('Log in / Sign up', [
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.login,
                label: 'Log In',
                active: false,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 12),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.login,
                label: 'Log In',
                active: true,
                onPressed: () {},
              ),
            ),
          ]),

          _section('Navigation Bar', [
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.navigationBar,
                activeIndex: _navIndex,
                onIndexSelected: (i) => setState(() => _navIndex = i),
              ),
            ),
          ]),

          _section('Menu Switch On / Off', [
            Text('FAQ / Contact Us', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.segmentedSwitch,
                segments: const ['FAQ', 'Contact Us'],
                selectedSegment: _faqIndex,
                onSegmentSelected: (i) => setState(() => _faqIndex = i),
              ),
            ),
            const SizedBox(height: 20),

            Text('Daily / Weekly / Monthly', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.segmentedSwitch,
                segments: const ['Daily', 'Weekly', 'Monthly'],
                selectedSegment: _periodIndex3,
                onSegmentSelected: (i) => setState(() => _periodIndex3 = i),
              ),
            ),
            const SizedBox(height: 20),

            Text('Daily / Weekly / Monthly / Year', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.segmentedSwitch,
                segments: const ['Daily', 'Weekly', 'Monthly', 'Year'],
                selectedSegment: _periodIndex4,
                onSegmentSelected: (i) => setState(() => _periodIndex4 = i),
              ),
            ),
            const SizedBox(height: 20),

            Text('General / Account / Services', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.segmentedSwitch,
                segments: const ['General', 'Account', 'Services'],
                selectedSegment: _categoryIndex,
                onSegmentSelected: (i) => setState(() => _categoryIndex = i),
              ),
            ),
            const SizedBox(height: 20),

            Text('Income / Expense', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            Row(
              children: [
                ButtonFactory.create(
                  ButtonViewModel(
                    type: ButtonType.incomeExpenseToggle,
                    label: 'Income',
                    amount: '\$4,120.00',
                    icon: Icons.south_west_rounded,
                    active: !_expenseSelected,
                    onPressed: () => setState(() => _expenseSelected = false),
                  ),
                ),
                const SizedBox(width: 12),
                ButtonFactory.create(
                  ButtonViewModel(
                    type: ButtonType.incomeExpenseToggle,
                    label: 'Expense',
                    amount: '\$1,187.40',
                    icon: Icons.north_east_rounded,
                    active: _expenseSelected,
                    onPressed: () => setState(() => _expenseSelected = true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text('Option 1', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              ButtonViewModel(
                type: ButtonType.optionPill,
                label: 'Option 1',
                active: _optionActive,
                onPressed: () => setState(() => _optionActive = !_optionActive),
              ),
            ),
            const SizedBox(height: 20),

            Text('Search', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            ButtonFactory.create(
              const ButtonViewModel(
                type: ButtonType.searchBar,
                label: 'Search',
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.title),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
