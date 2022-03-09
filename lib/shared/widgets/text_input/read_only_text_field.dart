import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../theme/theme_decoration.dart';

class ReadOnlyTextField extends StatefulWidget {
  const ReadOnlyTextField({
    Key? key,
    this.fieldKey,
    required this.lable,
    this.value,
    this.hint,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.textStyle,
    this.labelStyle,
  }) : super(key: key);
  final String? fieldKey;
  final String? value;
  final String lable;
  final String? hint;
  final TextInputType inputType;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  @override
  _ReadOnlyTextFieldState createState() => _ReadOnlyTextFieldState();
}

class _ReadOnlyTextFieldState extends State<ReadOnlyTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? '';
  }

  @override
  void didUpdateWidget(covariant ReadOnlyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        controller.text = widget.value ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controller,
      keyboardType: widget.inputType,
      obscureText: widget.obscureText,
      style: widget.textStyle,
      decoration: ThemeDecoration.inputNoneBorder.copyWith(
        hintText: widget.hint,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelStyle: widget.labelStyle,
        labelText: widget.lable,
        alignLabelWithHint: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: AppColor.gray1),
      ),
    );
  }
}
