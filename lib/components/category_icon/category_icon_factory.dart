import 'package:flutter/material.dart';
import 'category_icon_view_model.dart';
import 'category_icon_component.dart';

class CategoryIconFactory {
  CategoryIconFactory._();

  //mapa: cada categoria -> ícone e cor "default"
  static const Map<CategoryType, IconData> _icons = {
    CategoryType.food: Icons.restaurant,
    CategoryType.transport: Icons.directions_bus,
    CategoryType.groceries: Icons.shopping_cart,
    CategoryType.rent: Icons.home_work,
    CategoryType.gift: Icons.card_giftcard,
    CategoryType.medicine: Icons.medication,
    CategoryType.entertainment: Icons.movie,
    CategoryType.saving: Icons.savings,
    CategoryType.travel: Icons.flight,
    CategoryType.newHome: Icons.house,
    CategoryType.car: Icons.directions_car,
    CategoryType.wedding: Icons.favorite,
    CategoryType.more: Icons.add,
  };

  static Widget create(CategoryIconViewModel viewModel) {
    return CategoryIconComponent(
      viewModel: viewModel,
      icon: _icons[viewModel.type]!,
    );
  }
}