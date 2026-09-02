import '../../common/component_view_model.dart';

class DropdownViewModel extends ComponentViewModel {
  final List<String> options;
  final int selectedIndex;
  final void Function(int index) onOptionSelected;

  const DropdownViewModel({
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
  });

  @override
  void onTap() {}
}