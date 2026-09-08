import 'package:flutter/material.dart';
import '../common/app_text_styles.dart';
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
          _section('Input Fields', [
            Text('Verification Code', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.otpCode,
                initialValue: '273916',
              ),
            ),
            const SizedBox(height: 24),

            Text('Sign Up', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Full Name',
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Email',
                hint: 'example@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Mobile Number',
                hint: '+ 123 456 789',
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Date of Birth',
                hint: 'DD / MM / YYYY',
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'Confirm Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 24),

            Text('Login', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Username Or Email',
                hint: 'example@example.com',
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 24),

            Text('Change Password', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'Current Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'New Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.passwordField,
                label: 'Confirm New Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 24),

            Text('Nova Transação', style: AppTextStyles.paragraph),
            const SizedBox(height: 8),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.dateField,
                label: 'Date',
                initialValue: 'April 30, 2024',
                toggleValue: true,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.categoryDropdown,
                label: 'Category',
                initialValue: 'Food',
                options: ['Food', 'Transport', 'Shopping', 'Health', 'Gifts'],
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Amount',
                hint: '\$26.00',
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.textField,
                label: 'Expense Title',
                hint: 'Dinner',
              ),
            ),
            const SizedBox(height: 12),
            AdditionalElementFactory.create(
              const AdditionalElementViewModel(
                type: AdditionalElementType.messageArea,
                hint: 'Enter Message',
              ),
            ),
          ]),

          _section('Float Label', [
            AdditionalElementFactory.create(
              AdditionalElementViewModel(
                type: AdditionalElementType.confirmEndSession,
                onConfirm: () {},
                onCancel: () {},
              ),
            ),
            const SizedBox(height: 20),
            AdditionalElementFactory.create(
              AdditionalElementViewModel(
                type: AdditionalElementType.newCategoryCard,
                onChanged: (_) {},
                onConfirm: () {},
                onCancel: () {},
              ),
            ),
            const SizedBox(height: 20),
            AdditionalElementFactory.create(
              AdditionalElementViewModel(
                type: AdditionalElementType.confirmDeleteAccount,
                onConfirm: () {},
                onCancel: () {},
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
