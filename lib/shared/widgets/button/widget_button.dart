import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';

import '../../constants/colors.dart';
import '../../utils/common_widget.dart';
import '../../widgets/image_widget/fcore_image.dart';

class WidgetButton extends StatelessWidget {
  final double? width, iconWidth;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  final String? title;
  final double? fontSize;
  final Color? titleColor;
  final String? icon;

  final Color? backgroundColor;
  final Gradient? gradient;
  final BoxBorder? border;
  final Color? shadowColor;

  final VoidCallback onPressed;

  const WidgetButton({
    Key? key,
    this.width,
    this.iconWidth,
    this.height,
    this.radius,
    this.padding,
    this.title,
    this.fontSize,
    this.icon,
    this.backgroundColor,
    this.gradient,
    this.border,
    this.shadowColor,
    this.titleColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 56,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.primaryColorLight,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius ?? 8),
        //border: border,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FCoreImage(icon!, width: iconWidth ?? 20),
                  ),
            Text(
              title ?? '',
              style: TextAppStyle().genaralTextStyle().copyWith(
                    color: titleColor,
                    // fontWeight: FontWeight.w600,
                    // fontSize: fontSize,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
