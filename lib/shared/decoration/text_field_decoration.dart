import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/shared/constants/colors.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';

class TextFieldDecoration {
  TextFieldDecoration._();

  static InputDecoration borderLogin(
      {String? hintText,
      TextStyle? hintStype,
      Color? backgroundColor,
      Color borderColor = Colors.grey,
      Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      filled: backgroundColor != null,
      fillColor: backgroundColor,
      hintStyle: hintStype ??
          TextAppStyle().genaralTextStyle().copyWith(
                color: AppColor.sixTextColorLight,
                fontWeight: FontWeight.bold,
              ),
      //errorStyle: AppTextStyle.textErrorStyle,
      //contentPadding: const EdgeInsets.all(10),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      // disabledBorder: UnderlineInputBorder(
      //   borderRadius: BorderRadius.circular(10),
      //   borderSide: BorderSide(color: borderColor, width: 1),
      // ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minHeight: 18, minWidth: 18),
    );
  }

  static InputDecoration borderOutline(
      {String? labelText,
      TextStyle? labelStype,
      String? hintText,
      TextStyle? hintStype,
      Color? backgroundColor,
      double? radius,
      Color borderColor = Colors.grey,
      Widget? prefixIcon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: labelStype,
      hintText: hintText,
      filled: backgroundColor != null,
      fillColor: backgroundColor,
      hintStyle: hintStype ??
          TextAppStyle().genaralTextStyle().copyWith(
                color: AppColor.sixTextColorLight,
                fontWeight: FontWeight.bold,
              ),
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: Get.theme.errorColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: Get.theme.errorColor, width: 1),
      ),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minHeight: 18, minWidth: 18),
    );
  }

  static InputDecoration borderOtp(
      {String? labelText,
      TextStyle? labelStype,
      String? hintText,
      TextStyle? hintStype,
      Color? backgroundColor,
      double? radius,
      EdgeInsetsGeometry? contentPadding,
      Color borderColor = Colors.grey,
      Widget? prefixIcon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: labelStype,
      hintText: hintText,
      filled: backgroundColor != null,
      fillColor: backgroundColor,
      hintStyle: hintStype ??
          TextAppStyle().genaralTextStyle().copyWith(
                color: AppColor.sixTextColorLight,
                fontWeight: FontWeight.bold,
              ),
      contentPadding: contentPadding ?? null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
    );
  }

  static InputDecoration borderDot(
      {String? hintText,
      TextStyle? hintStype,
      Color? backgroundColor,
      double? radius,
      Color borderColor = Colors.grey,
      Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      filled: backgroundColor != null,
      fillColor: backgroundColor,
      hintStyle: hintStype ??
          TextAppStyle().genaralTextStyle().copyWith(
                color: AppColor.sixTextColorLight,
                fontWeight: FontWeight.bold,
              ),
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: Get.theme.errorColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: Get.theme.errorColor, width: 1),
      ),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minHeight: 18, minWidth: 18),
    );
  }

  static InputDecoration borderSearch({String? hintText}) {
    return InputDecoration(
      //hintStyle: AppTextStyle.textHintStyle,
      hintText: hintText,
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      prefixIcon: const Icon(Icons.search),
    );
  }

  static InputDecoration checkoutBorderSearch({String? hintText}) {
    return InputDecoration(
      //hintStyle: AppTextStyle.textHintStyle,
      hintText: hintText,
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      suffixIcon: const Icon(Icons.search),
    );
  }
}
