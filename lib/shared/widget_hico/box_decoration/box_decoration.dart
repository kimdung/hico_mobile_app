import 'package:flutter/material.dart';
import 'package:hico/shared/constants/colors.dart';

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget({
    Key? key,
    required this.child,
    required this.height,
    this.radius,
    this.border,
    this.shadow,
    this.shadowColor,
    this.color,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? radius;
  final Border? border;
  final bool? shadow;
  final Color? shadowColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius:
            radius != null ? BorderRadius.circular(radius ?? 0) : null,
        color: color ?? Colors.white,
        border: border,
        boxShadow: shadow == true
            ? [
                BoxShadow(
                  color: shadowColor ??
                      AppColor.dividerColorLight.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
