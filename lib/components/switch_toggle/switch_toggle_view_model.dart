import '../action_button/action_button_view_model.dart'; // reaproveita buttonviewmodel

//iewmodel para o seletor de duas opções
//também herda de buttonviewmodel, reaproveitando o contrato base, mas adicionando o que é específico de um switch: as opções e o índice ativo
class SwitchToggleViewModel extends ButtonViewModel {
  final List<String> options;
  final int selectedIndex;
  final void Function(int index) onOptionSelected;

  const SwitchToggleViewModel({
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
    super.isEnabled = true,
  }) : super(label: ''); //label não é usado neste componente

  @override
  void onTap() {} //não se aplica, a ação real está em onoptionselected
}