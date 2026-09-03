import '../../common/component_view_model.dart';

class AccordionViewModel extends ComponentViewModel {
  final String question;
  final String answer;
  final bool isExpanded;
  final void Function() onToggle;

  const AccordionViewModel({
    required this.question,
    required this.answer,
    required this.onToggle,
    this.isExpanded = false,
  });

  @override
  void onTap() => onToggle();
}