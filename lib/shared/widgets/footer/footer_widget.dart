import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../methods/common_method.dart';
import '../../styles/text_style/text_style.dart';

class Footer extends StatelessWidget {
  final String totalPrice;
  final String titleButton;
  final String title;
  final VoidCallback onButtonPressed;
  Footer({
    Key? key,
    required this.totalPrice,
    required this.titleButton,
    required this.onButtonPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                Text(formatVnd('$totalPrice'),
                    style: TextAppStyle().textDisableButtonStyle())
              ],
            ),
            const SizedBox(height: 16),
            inputInformationButton(
                onButtonPressed: onButtonPressed, titleButton: titleButton)
          ],
        ));
  }
}

Widget inputInformationButton({
  required VoidCallback onButtonPressed,
  required String titleButton,
}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    onPressed: onButtonPressed,
    elevation: 0,
    disabledColor: AppColor.gray1,
    minWidth: double.infinity,
    color: AppColor.backgroundButtonYellowColor,
    child: Center(
      child: Text(
        titleButton,
        style: TextStyle(
          color: AppColor.secondTextColorLight,
          fontSize: 16,
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
