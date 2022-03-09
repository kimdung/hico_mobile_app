import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../theme/theme_decoration.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.lable,
    required this.hint,
    this.fieldKey,
    Key? key,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.isRequired = false,
    // this.validationMessages,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.value,
  }) : super(key: key);

  final String? fieldKey;
  final String lable;
  final String hint;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final bool isRequired;
  // final Map<String, String> Function(FormControl<dynamic> messages)?
  //     validationMessages;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? value;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: value);
    return Container(
      decoration: ThemeDecoration.textFieldWithShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: lable,
                    style: ThemeDecoration.textLabelForm,
                  ),
                  isRequired
                      ? TextSpan(
                          text: ' *',
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColor.accent,
                                  ),
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              readOnly: readOnly,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: onTap,
              onChanged: onChanged,
              keyboardType: inputType,
              obscureText: obscureText,
              textInputAction: textInputAction,
              validator: validator,
              style: ThemeDecoration.textLabelForm,
              decoration: ThemeDecoration.inputNoneBorder.copyWith(
                hintText: hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColor.gray1),
              ),
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
