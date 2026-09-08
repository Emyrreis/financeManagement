import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../common/app_text_styles.dart';
import 'button_view_model.dart';

class ButtonComponent extends StatelessWidget {
  final ButtonViewModel viewModel;

  const ButtonComponent({
    super.key,
    required this.viewModel,
  });

  static const _navIcons = [
    Icons.home_outlined,
    Icons.search,
    Icons.swap_horiz,
    Icons.layers_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    switch (viewModel.type) {
      case ButtonType.login:
      case ButtonType.signUp:
        return _pill(
          label: viewModel.label,
          filled: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onPressed,
          colors: colors,
        );

      case ButtonType.navigationBar:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < _navIcons.length; i++)
                _navIconButton(
                  icon: _navIcons[i],
                  active: viewModel.activeIndex == i,
                  onTap: viewModel.enabled
                      ? () => viewModel.onIndexSelected?.call(i)
                      : null,
                ),
            ],
          ),
        );


      case ButtonType.segmentedSwitch:
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              for (var i = 0; i < viewModel.segments.length; i++)
                Expanded(
                  child: GestureDetector(
                    onTap: viewModel.enabled
                        ? () => viewModel.onSegmentSelected?.call(i)
                        : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: i == viewModel.selectedSegment
                            ? AppColors.mainGreen
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        viewModel.segments[i],
                        style: AppTextStyles.paragraph.copyWith(
                          fontWeight: i == viewModel.selectedSegment
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );

      case ButtonType.optionPill:
        return SizedBox(
          width: double.infinity,
          child: _pill(
            label: viewModel.label,
            filled: viewModel.active,
            enabled: viewModel.enabled,
            onTap: viewModel.onPressed,
            colors: colors,
          ),
        );

      case ButtonType.incomeExpenseToggle:
        return _incomeExpenseCard(
          label: viewModel.label,
          amount: viewModel.amount ?? '',
          icon: viewModel.icon ?? Icons.payments_outlined,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onPressed,
        );

      case ButtonType.searchBar:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: AppColors.lettersIcons, size: 20),
              const SizedBox(width: 8),
              Text(
                viewModel.label.isEmpty ? 'Search' : viewModel.label,
                style: AppTextStyles.paragraph,
              ),
            ],
          ),
        );
    }
  }

  Widget _pill({
    required String label,
    required bool filled,
    required bool enabled,
    required VoidCallback? onTap,
    required ColorScheme colors,
  }) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? colors.primary : AppColors.lightGreen,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(label),
      ),
    );
  }

  Widget _navIconButton({
    required IconData icon,
    required bool active,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.mainGreen : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
          color: active ? Colors.white : AppColors.lettersIcons,
        ),
      ),
    );
  }

  Widget _incomeExpenseCard({
    required String label,
    required String amount,
    required IconData icon,
    required bool active,
    required bool enabled,
    required VoidCallback? onTap,
  }) {
    final background = active ? AppColors.oceanBlue : AppColors.lightGreen;
    final textColor = active ? Colors.white : AppColors.lettersIcons;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: textColor, width: 1),
              ),
              child: Icon(icon, size: 16, color: textColor),
            ),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 12, color: textColor)),
            const SizedBox(height: 2),
            Text(
              amount,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
