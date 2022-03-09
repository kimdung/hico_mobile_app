import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../theme/theme_decoration.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    required this.lable,
    required this.hint,
    Key? key,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  final String lable;
  final String hint;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextSpan(
                    text: '*',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: AppColor.accent,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              obscureText: obscureText,
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
