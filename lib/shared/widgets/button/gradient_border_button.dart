import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppGradientBorderButton extends StatelessWidget {
  const AppGradientBorderButton({
    required this.onPressed,
    required this.child,
    this.height = 48,
    Key? key,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final double height;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      constraints: BoxConstraints(minHeight: height),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? AppColor.primaryColorLight),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        color: backgroundColor ?? Colors.white,
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
