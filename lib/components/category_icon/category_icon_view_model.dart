import '../../common/component_view_model.dart';

enum CategoryType {
  food, transport, groceries, rent, gift, medicine,
  entertainment, saving, travel, newHome, car, wedding, more,
}

///viewmodel do ícone de categoria
class CategoryIconViewModel extends ComponentViewModel {
  final CategoryType type;
  final bool isPressed; // estado visual (default = azul claro, pressed = azul forte)
  final void Function() onSelected;

  const CategoryIconViewModel({
    required this.type,
    required this.onSelected,
    this.isPressed = false,
  });

  @override
  void onTap() => onSelected();
}