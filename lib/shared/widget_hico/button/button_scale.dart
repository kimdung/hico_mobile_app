import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ButtonScale extends StatelessWidget {
  const ButtonScale({
    required this.onPressed,
    required this.child,
    this.height = 48,
    Key? key,
    this.borderRadius,
    this.borderColor,
    this.gradientBackground = false,
    this.shadow = false,
    this.backgroundColor,
    this.padding,
    this.borderWidth,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final double height;
  final double? padding;
  final Color? borderColor;
  final double? borderWidth;
  final bool gradientBackground;
  final bool shadow;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: height),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
            color: borderColor ?? Colors.black, width: borderWidth ?? 1),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: AppColor.colorFF4880.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
        gradient: gradientBackground
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.colorFF7AA3,
                  AppColor.colorFF4880,
                ],
              )
            : null,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 10),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
