// part of 'form_builder.dart';

// extension _FormBuilderChildren on FormBuilders {
//   Map<String, String> get validateMessage => {
//         ValidationMessage.required: 'This field is required.',
//         ValidationMessage.email: 'Invalid email.',
//         ValidationMessage.pattern: 'Value does not match pattern.'
//       };

//   Widget _buildEnumField({
//     required FormFieldSettings settings,
//     Function(String value)? onChanged,
//   }) {
//     final items = (settings.items)
//         .map((item) => DropdownItem<String>(item.text, item.value))
//         .toList();
//     return DropdownInput<String>(
//       labelText: settings.label,
//       contentPadding: EdgeInsets.zero,
//       items: items,
//       onChanged: onChanged,
//       isRequired: settings.requiredField,
//       // value: ,
//       // validator: ,

//     );
//   }

//   Widget _buildTextFormField({
//     TextInputType textInputType = TextInputType.text,
//     TextInputAction textInputAction = TextInputAction.next,
//     required FormFieldSettings settings,
//     Function(String value)? onChanged,
//   }) {
//     return TextInputField(
//       // formControlName: settings.fieldKey,
//       lable: settings.label,
//       hint: settings.hintText ?? '',
//       textInputAction: textInputAction,
//       inputType: textInputType,
//       isRequired: settings.requiredField,
//       // validator: ,
//       onChanged: onChanged,
//     );
//   }

//   Widget _buildDateTimeField({
//     required FormFieldSettings settings,
//     required Function(String value) onChanged,
//   }) {
//     return DatePickerInput(
//       labelText: settings.label,
//       // validator: ,
//       // value: ,
//       onChanged: (value) {
//         onChanged(value?.toIso8601String() ?? '');
//       },
//       hintText: settings.hintText,
//       suffixIcon: const Icon(
//         Icons.calendar_today_sharp,
//         size: 20,
//       ),
//     );
//   }

//   Widget _buildReadOnlyField(FormFieldSettings setting, FormGroup formGroup) {
//     return _buildTextFormField(settings: setting);
//   }
// }
