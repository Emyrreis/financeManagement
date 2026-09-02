//classe abstrata base
abstract class ComponentViewModel {
  const ComponentViewModel();

  //delegate: a ação real é sempre fornecida por quem cria a view
  void onTap();
}