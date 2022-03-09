import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/dropdown_widget/drop_down_widget.dart';

class DropdownInputField<T> extends ReactiveFormField<T, T> {
  final String name;
  final String? labelText;
  final String? placeholder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final List<DropdownItem<T>>? items;
  final Function(T value)? onChanged;
  final EdgeInsets? contentPadding;
  final bool isRequired;
  final String? hintText;
  @override
  final Map<String, String> Function(FormControl<dynamic> messages)?
      validationMessages;

  DropdownInputField({
    Key? key,
    required this.name,
    this.labelText,
    this.placeholder,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.items,
    this.onChanged,
    this.validationMessages,
    this.contentPadding,
    this.isRequired = false,
    this.hintText,
  }) : super(
            key: key,
            formControlName: name,
            validationMessages: validationMessages,
            showErrors: (control) =>
                control.invalid && (control.dirty || control.touched),
            builder: (ReactiveFormFieldState<T, T> field) {
              return DropdownInput<T>(
                value: field.value,
                items: items,
                labelText: labelText,
                errorText: field.errorText,
                suffixIcon: suffixIcon,
                placeholder: hintText,
                contentPadding: contentPadding,
                isRequired: isRequired,
                onChanged: (value) {
                  field.didChange(value);
                  if (onChanged != null) {
                    onChanged(value);
                  }
                },
              );
            });
}
