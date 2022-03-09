import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/shared/constants/common.dart';
import '../../constants/colors.dart';

part 'borrow_data_page/borrow_data_text_style.dart';
part 'home_page/home_page_text_style.dart';
part 'moto_page/moto_page_text_style.dart';
part 'product_page/product_page_text_style.dart';
part 'payment_page/payment_page_text_style.dart';
part 'setting_profile/setting_profile_text_style.dart';
part 'health_assistant_page/health_assistant_style.dart';

/// Define color at theme_data.dart
class TextAppStyle {
  static const String appFont = 'Mulish';

  TextStyle versionTextStyle() {
    return Get.theme.textTheme.headline5!;
  }

  TextStyle versionContentTextStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return Get.theme.textTheme.headline4!;
  }

  TextStyle textEnableButtonStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textDisableButtonStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle labelTextFormFieldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle hintTextFormFieldStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle greyTextFormFieldStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color!.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textInputFormFieldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle titlePageTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle titlePage2TextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle contentPageTextStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 13,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle contentPage2TextStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textClickColorStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle titleQrCodeColorStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textPriceColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textTitleNameColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle titlePriceColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
    );
  }

  TextStyle textAppBarColorStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    );
  }

  TextStyle titleCardViewColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    );
  }

  TextStyle titleButtonStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.secondTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle titleButtonPinkStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle titleBoldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle titleAppBarStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.thirdTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle genaralTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle genaralBlackTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.thirdTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle secondTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle bottomBarTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.menuTextColorLight,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      fontFamily: 'SVN-Jeko',
    );
  }

// mini text
  TextStyle miniTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: CommonConstants.miniText,
      fontWeight: FontWeight.w500,
      fontFamily: 'SVN-Jeko',
    );
  }

  // small text
  TextStyle smallTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: CommonConstants.smallText,
      fontWeight: FontWeight.w500,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle smallTextGrey() {
    return smallTextStype().copyWith(
      color: AppColor.fifthTextColorLight,
    );
  }

  TextStyle smallTextPink() {
    return smallTextStype().copyWith(
      color: AppColor.primaryTextColorLight,
    );
  }

  TextStyle smallTextBlack() {
    return smallTextStype().copyWith(
      color: AppColor.thirdTextColorLight,
    );
  }

  //nomal text
  TextStyle normalTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return const TextStyle(
      color: Colors.black,
      fontSize: CommonConstants.normalText,
      fontWeight: FontWeight.w500,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle normalTextGrey() {
    return normalTextStype().copyWith(
      color: AppColor.fifthTextColorLight,
    );
  }

  TextStyle normalTextPink() {
    return normalTextStype().copyWith(
      color: AppColor.primaryTextColorLight,
    );
  }

  TextStyle normalTextWhite() {
    return normalTextStype().copyWith(
      color: Colors.white,
    );
  }

  //large text
  TextStyle largeTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return const TextStyle(
      color: Colors.black,
      fontSize: CommonConstants.largeText,
      fontWeight: FontWeight.w500,
      fontFamily: 'SVN-Jeko',
    );
  }

  TextStyle largeTextGrey() {
    return largeTextStype().copyWith(
      color: AppColor.fifthTextColorLight,
    );
  }

  TextStyle largeTextPink() {
    return largeTextStype().copyWith(
      color: AppColor.primaryTextColorLight,
    );
  }
}
