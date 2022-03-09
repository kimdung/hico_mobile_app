// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// import '../widgets/date_picker/date_time_picker.dart';

// class DatePickerInputField extends ReactiveFormField<DateTime, DateTime> {
//   final String name;
//   final String? labelText;
//   final String? hintText;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final Widget? suffixIcon;
//   @override
//   final Map<String, String> Function(FormControl<dynamic> messages)?
//       validationMessages;
//   DatePickerInputField({
//     Key? key,
//     required this.name,
//     this.labelText,
//     this.controller,
//     this.focusNode,
//     this.validationMessages,
//     this.suffixIcon,
//     this.hintText,
//   }) : super(
//           key: key,
//           formControlName: name,
//           validationMessages: validationMessages,
//           showErrors: (control) =>
//               control.invalid && (control.dirty || control.touched),
//           builder: (field) {
//             return DatePickerInput(
//               labelText: labelText,
//               value: field.value,
//               onChanged: (val) {
//                 field.didChange(val);
//               },
//               errorText: field.errorText,
//               suffixIcon: suffixIcon,
//               controller: controller,
//               focusNode: focusNode,
//               hintText: hintText,
//             );
//           },
//         );
// }
