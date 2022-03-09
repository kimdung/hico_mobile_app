import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    required this.onPressed,
    required this.child,
    this.height = 48,
    Key? key,
    this.borderRadius,
    this.shadow = 1,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final double height;
  final int shadow;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      constraints: BoxConstraints(minHeight: height),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        color: onPressed == null ? AppColor.primary.withOpacity(0.4) : null,
        boxShadow: shadow == 1
            ? [
                BoxShadow(
                  color: AppColor.colorFF4880.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            : null,
        gradient: onPressed != null
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
        padding: const EdgeInsets.symmetric(horizontal: 14),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
