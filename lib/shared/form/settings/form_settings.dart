

enum FormFieldType {
  TEXT,
  ENUM,
  DATETIME,
  NUMBER,
}

class FormFieldSettings<T> {
  final String fieldKey;
  final String label;
  final FormFieldType type;
  final String? mapFrom;
  final bool readOnly;
  final String? hintText;
  final List<dynamic> items;
  final bool requiredField;
  final Function(T value)? onChanged;

  FormFieldSettings({
    required this.fieldKey,
    required this.label,
    required this.type,
    this.mapFrom,
    this.hintText,
    this.items = const [],
    this.onChanged,
    this.readOnly = false,
    this.requiredField = false,
  });
}
