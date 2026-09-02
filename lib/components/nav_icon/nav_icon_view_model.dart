import '../../common/component_view_model.dart';

enum NavItemType { home, analysis, transactions, category, profile }

class NavIconViewModel extends ComponentViewModel {
  final NavItemType type;
  final bool isActive;
  final void Function() onSelected;

  const NavIconViewModel({
    required this.type,
    required this.onSelected,
    this.isActive = false,
  });

  @override
  void onTap() => onSelected();
}