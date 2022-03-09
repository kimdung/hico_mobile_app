// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// import '../../../../shared/form/text_input_field.dart';
// import '../../../../shared/widgets/date_picker/date_time_picker.dart';
// import '../../../../shared/widgets/dropdown_widget/drop_down_widget.dart';
// import '../settings/form_settings.dart';

// part 'form_builder_children.dart';

// mixin FormBuilders {
//   Widget buildField(FormFieldSettings setting) {
//     return _formBuilder(setting: setting);
//   }

//   Widget _formBuilder({required FormFieldSettings setting}) {
//     switch (setting.type) {
//       case FormFieldType.ENUM:
//         return _buildEnumField(
//           settings: setting,
//           onChanged: (value) {},
//         );
//       case FormFieldType.TEXT:
//         return _buildTextFormField(
//           settings: setting,
//           onChanged: (value) {},
//         );
//       case FormFieldType.DATETIME:
//         return _buildDateTimeField(
//           settings: setting,
//           onChanged: (value) {},
//         );
//       case FormFieldType.NUMBER:
//         return _buildTextFormField(
//           settings: setting,
//           textInputType: TextInputType.number,
//           onChanged: (value) {},
//         );
//       default:
//         return Container();
//     }
//   }
// }
