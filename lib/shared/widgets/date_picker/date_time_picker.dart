// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// import '../../constants/colors.dart';
// import '../../theme/theme_decoration.dart';
// import '../../utils/date_formatter.dart';

// class DatePickerInput extends StatefulWidget {
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final Function(DateTime? val)? onChanged;
//   final String? errorText;
//   final Widget? suffixIcon;
//   final String? labelText;
//   final bool isRequired;
//   final DateTime? value;
//   final DateTime? firstDate;
//   final DateTime? lastDate;
//   final TextInputType keyboardType;
//   final TextStyle? textStyle;
//   final TextInputAction textInputAction;
//   final String? hintText;
//   final FormFieldValidator<String>? validator;

//   DatePickerInput({
//     Key? key,
//     this.controller,
//     this.focusNode,
//     this.onChanged,
//     this.errorText,
//     this.suffixIcon,
//     this.labelText,
//     this.value,
//     this.firstDate,
//     this.lastDate,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.done,
//     this.textStyle,
//     this.hintText,
//     this.validator,
//     this.isRequired = false,
//   }) : super(key: key);

//   @override
//   _DatePickerInputState createState() => _DatePickerInputState();
// }

// class _DatePickerInputState extends State<DatePickerInput> {
//   bool hasFocus = false;

//   DateTime get firstDate => widget.firstDate ?? DateTime(1900);
//   DateTime get lastDate => widget.lastDate ?? DateTime(2100);

//   DateTime? _currentValue;
//   DateTime? get currentValue => _currentValue;
//   set currentValue(DateTime? value) {
//     _currentValue = value;
//     setState(() {
//       controller.text = DateFormatter.formatDate(value);
//     });
//   }

//   TextEditingController? _controller;
//   TextEditingController get controller {
//     if (widget.controller != null) {
//       return widget.controller!;
//     }
//     _controller ??=
//         TextEditingController(text: DateFormatter.formatDate(widget.value));
//     return _controller!;
//   }

//   @override
//   void initState() {
//     super.initState();
//     currentValue = widget.value ?? DateTime.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: ThemeDecoration.textFieldWithShadow,
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 12),
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: widget.labelText,
//                     style: ThemeDecoration.textLabelForm,
//                   ),
//                   widget.isRequired
//                       ? TextSpan(
//                           text: ' *',
//                           style:
//                               Theme.of(context).textTheme.subtitle1?.copyWith(
//                                     color: AppColor.accent,
//                                   ),
//                         )
//                       : const TextSpan(),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: TextFormField(
//               readOnly: true,
//               controller: controller,
//               focusNode: widget.focusNode,
//               validator: widget.validator,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: ThemeDecoration.inputNoneBorder.copyWith(
//                 hintStyle: Theme.of(context)
//                     .textTheme
//                     .bodyText2
//                     ?.copyWith(color: AppColor.gray1),
//                 hintText: widget.hintText,
//                 suffixIconConstraints: const BoxConstraints(
//                   maxHeight: 32,
//                   minHeight: 32,
//                 ),
//                 suffixIcon: widget.suffixIcon,
//                 errorText: widget.errorText,
//               ),
//               onTap: _onChangeButtonPressed,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onChangeButtonPressed() {
//     DatePicker.showDatePicker(
//       context,
//       currentTime: currentValue ?? DateTime.now(),
//       minTime: firstDate,
//       maxTime: lastDate,
//       onConfirm: (time) {
//         currentValue = time;
//         if (widget.onChanged != null) {
//           widget.onChanged!(time);
//         }
//       },
//     );
//   }
// }
