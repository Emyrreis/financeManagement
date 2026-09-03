import '../../common/component_view_model.dart';

enum ActionDialogType { confirmation, withInput }

class ActionDialogViewModel extends ComponentViewModel {
  final String title;
  final String message; // usado quando type = confirmation
  final String primaryLabel;
  final String secondaryLabel;
  final ActionDialogType type;
  final void Function() onConfirm;
  final void Function() onCancel;

  const ActionDialogViewModel({
    required this.title,
    required this.primaryLabel,
    required this.onConfirm,
    required this.onCancel,
    this.message = '',
    this.secondaryLabel = 'Cancel',
    this.type = ActionDialogType.confirmation,
  });

  @override
  void onTap() => onConfirm();
}