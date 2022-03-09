import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../theme/theme_decoration.dart';

class ButtonAddForm extends StatelessWidget {
  final Function() onClick;
  final String title;
  const ButtonAddForm({Key? key, required this.onClick, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
      child: Material(
        color: AppColor.secondTextColorLight.withOpacity(0.5),
        child: InkWell(
            onTap: onClick,
            child: Container(
              color: AppColor.eightTextColorLight.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: ThemeDecoration.textLabelForm
                        .copyWith(color: AppColor.eightTextColorLight),
                  ),
                  Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: AppColor.eightTextColorLight.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColor.eightTextColorLight,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
