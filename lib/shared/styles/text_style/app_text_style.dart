import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

/// Define color at theme_data.dart
class AppTextStyle {
  AppTextStyle._();

  static TextStyle get welcomeStyle => Get.theme.textTheme.headline5!;

  // Common font-size 14
  static TextStyle get textStyle => Get.theme.textTheme.bodyText1!;

// font-size 16
  static TextStyle get primaryTextStyle => Get.theme.textTheme.bodyText1!;

  // font-size 12
  static TextStyle get secondTextStyle => Get.theme.textTheme.bodyText2!;

  static TextStyle get textBoldStyle =>
      Get.theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get textErrorStyle =>
      Get.theme.textTheme.bodyText1!.copyWith(color: AppColor.errorColor);

  static TextStyle get textButtonStyle =>
      Get.theme.textTheme.bodyText1!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get textButtonWhiteStyle =>
      Get.theme.textTheme.bodyText1!.copyWith(
        color: AppColor.secondTextColorLight,
        fontWeight: FontWeight.w500,
      );

  // Dialog
  static TextStyle get textKeyPadStyle =>
      Get.theme.textTheme.headline5!.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get titleDialogStyle => Get.theme.textTheme.headline2!;
  static TextStyle get textDialogStyle => Get.theme.textTheme.headline1!;

  // Home screen
  static TextStyle get textHomeNameStyle =>
      Get.theme.textTheme.headline2!.copyWith(
        color: AppColor.secondTextColorLight,
        fontWeight: FontWeight.bold,
      );

  // Choose staff
  static TextStyle get titleStyle => Get.theme.textTheme.headline2!;

  // Service screen
  static TextStyle get titleCategory => Get.theme.textTheme.headline3!.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get cardCaption => Get.theme.textTheme.headline3!.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColor.secondTextColorLight,
      );
}
