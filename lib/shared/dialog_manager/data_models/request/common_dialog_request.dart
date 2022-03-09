class CommonDialogRequest {
  CommonDialogRequest({
    required this.description,
    this.title,
    this.typeDialog,
    this.isMustTapButton,
    this.titleButton,
    this.defineEvent,
  });

  final String? title;
  final String description;
  final String? typeDialog;
  final bool? isMustTapButton;
  final String? titleButton;
  final String? defineEvent;
}
