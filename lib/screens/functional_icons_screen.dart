import 'package:flutter/material.dart';
import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../components/functional_icons/functional_icon_factory.dart';
import '../components/functional_icons/functional_icon_view_model.dart';


class FunctionalIconsScreen extends StatelessWidget {
  const FunctionalIconsScreen({super.key});

  static const _categoryPrimaryIcons = [
    Icons.restaurant,
    Icons.directions_bus,
    Icons.shopping_bag,
    Icons.payments,
    Icons.card_giftcard,
    Icons.medication,
    Icons.sell,
    Icons.savings,
    Icons.add,
  ];

  static const _categorySecondaryIcons = [
    Icons.flight,
    Icons.home,
    Icons.directions_car,
    Icons.diamond,
  ];

  static const _navigationIcons = [
    Icons.home_outlined,
    Icons.search,
    Icons.swap_horiz,
    Icons.layers_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Functional Icons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _section(
            'Categories Menu | Primary',
            [
              _iconRow('Default', _categoryPrimaryIcons, active: false, type: FunctionalIconType.categoryPrimary),
              const SizedBox(height: 8),
              _iconRow('Pressed', _categoryPrimaryIcons, active: true, type: FunctionalIconType.categoryPrimary),
            ],
          ),
          _section(
            'Categories Menu | Secondary',
            [
              _iconRow('Default', _categorySecondaryIcons, active: false, type: FunctionalIconType.categorySecondary),
              const SizedBox(height: 8),
              _iconRow('Pressed', _categorySecondaryIcons, active: true, type: FunctionalIconType.categorySecondary),
            ],
          ),
          _section(
            'Loading Animation: Check | Error',
            [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.mainGreen,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FunctionalIconFactory.create(
                      const FunctionalIconViewModel(type: FunctionalIconType.loadingCheck),
                    ),
                    FunctionalIconFactory.create(
                      const FunctionalIconViewModel(type: FunctionalIconType.loadingError),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _section(
            'Navigation Menu',
            [
              _iconRow('Default', _navigationIcons, active: false, type: FunctionalIconType.navigation),
              const SizedBox(height: 8),
              _iconRow('Pressed', _navigationIcons, active: true, type: FunctionalIconType.navigation),
            ],
          ),
          _section(
            'Checkbox & Radio',
            [
              _statePairRow('Radio', FunctionalIconType.radio),
              _statePairRow('Checkbox', FunctionalIconType.checkbox),
              _statePairRow('Notificação', FunctionalIconType.notificationBell),
              _statePairRow('Busca', FunctionalIconType.searchAction),
              _statePairRow('Calendário', FunctionalIconType.calendarAction),
              _statePairRow('Câmera', FunctionalIconType.cameraAction),
              _statePairRow('Microfone', FunctionalIconType.micAction),
              _statePairRow('Enviar', FunctionalIconType.sendAction),
            ],
          ),
          _section(
            'Eyes-Pass',
            [
              FunctionalIconFactory.create(
                const FunctionalIconViewModel(type: FunctionalIconType.eyesPass),
              ),
            ],
          ),
          _section(
            'Toggle Switch',
            [
              Row(
                children: [
                  FunctionalIconFactory.create(
                    const FunctionalIconViewModel(type: FunctionalIconType.toggle, active: true),
                  ),
                  const SizedBox(width: 16),
                  FunctionalIconFactory.create(
                    const FunctionalIconViewModel(type: FunctionalIconType.toggle, active: false),
                  ),
                ],
              ),
            ],
          ),
          _section(
            'Calendar',
            [
              Row(
                children: [
                  FunctionalIconFactory.create(
                    const FunctionalIconViewModel(
                      type: FunctionalIconType.calendarDate,
                      dayLabel: '24',
                    ),
                  ),
                  const SizedBox(width: 12),
                  FunctionalIconFactory.create(
                    const FunctionalIconViewModel(
                      type: FunctionalIconType.calendarDate,
                      dayLabel: '24',
                      active: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  Widget _iconRow(
      String label,
      List<IconData> icons, {
        required bool active,
        required FunctionalIconType type,
      }) {
    return Row(
      children: [
        SizedBox(width: 64, child: Text(label, style: AppTextStyles.paragraph)),
        Expanded(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final icon in icons)
                FunctionalIconFactory.create(
                  FunctionalIconViewModel(type: type, icon: icon, active: active),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statePairRow(String label, FunctionalIconType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 140, child: Text(label, style: AppTextStyles.paragraph)),
          FunctionalIconFactory.create(
            FunctionalIconViewModel(type: type, active: false),
          ),
          const SizedBox(width: 20),
          FunctionalIconFactory.create(
            FunctionalIconViewModel(type: type, active: true),
          ),
        ],
      ),
    );
  }
}
