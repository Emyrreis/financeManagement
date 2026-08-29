//classe abstrata: define o "contrato" de qualquer botão
//Nnão pode ser instanciada diretamente — cada botão concreto precisa herdar dela e fornecer seus próprios dados
abstract class ButtonViewModel {
  final String label;
  final bool isEnabled;

  const ButtonViewModel({
    required this.label,
    this.isEnabled = true,
  });

  //usando o delegate, aqui não está sendo implementada a ação do clique, ela é fornecida por quem cria a viewmodel
  void onTap();
}

enum ActionButtonVariant { activate, inactive }

//viewmodel concreta para a ação de login do app
class ActionButtonViewModel extends ButtonViewModel {
  final ActionButtonVariant variant;
  final void Function() onPressed;

  const ActionButtonViewModel({
    required super.label,
    required this.variant,
    required this.onPressed,
    super.isEnabled = true,
  });

  @override
  void onTap() => onPressed();
}