import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../../theme/theme_decoration.dart';

class RadioButtonWidget extends StatefulWidget {
  final List<String> listValueDefult;
  final String lable;
  final String? hint;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final bool readOnly;
  bool? valueChecked;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;

  final FormFieldValidator<String>? validator;
  final String? value;
  final bool isRequired;

  RadioButtonWidget({
    Key? key,
    required this.lable,
    required this.listValueDefult,
    this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.valueChecked = false,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.isRequired = false,
    this.value,
  }) : super(key: key);

  @override
  _RadioButtontState createState() => _RadioButtontState();
}

class _RadioButtontState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: widget.value);
    return Container(
      decoration: ThemeDecoration.textFieldWithShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.lable,
                    style: ThemeDecoration.textLabelForm,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _LinkedLabelRadio(
                label: widget.listValueDefult[0],
                value: false,
                groupValue: widget.valueChecked!,
                onChanged: (bool newValue) {
                  setState(() {
                    widget.valueChecked = newValue;
                  });
                },
              ),
              const SizedBox(
                width: 32,
              ),
              _LinkedLabelRadio(
                label: widget.listValueDefult[1],
                value: true,
                groupValue: widget.valueChecked!,
                onChanged: (bool newValue) {
                  setState(() {
                    widget.valueChecked = newValue;
                  });
                },
              ),
            ],
          ),
          widget.isRequired
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onTap: widget.onTap,
                    onChanged: widget.onChanged,
                    keyboardType: widget.inputType,
                    obscureText: widget.obscureText,
                    textInputAction: widget.textInputAction,
                    validator: widget.validator,
                    style: ThemeDecoration.textLabelForm,
                    decoration: ThemeDecoration.inputNoneBorder.copyWith(
                      hintText: widget.hint,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColor.gray1),
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}

Widget _LinkedLabelRadio({
  required String label,
  required bool groupValue,
  required bool value,
  required Function onChanged,
}) {
  return Row(
    children: <Widget>[
      Radio<bool>(
          activeColor: AppColor.eightTextColorLight,
          groupValue: groupValue,
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue);
          }),
      RichText(
        text: TextSpan(
          text: label,
          style: TextAppStyle().textPhoneNumberStyle(),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('Label has been tapped.');
            },
        ),
      ),
    ],
  );
}
