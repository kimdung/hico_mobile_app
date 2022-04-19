import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';

part 'borrow_data_page/borrow_data_text_style.dart';
part 'home_page/home_page_text_style.dart';
part 'moto_page/moto_page_text_style.dart';
part 'product_page/product_page_text_style.dart';
part 'payment_page/payment_page_text_style.dart';
part 'setting_profile/setting_profile_text_style.dart';
part 'health_assistant_page/health_assistant_style.dart';

/// Define color at theme_data.dart
class TextAppStyle {
  static const String appFont = 'SVN-Jeko';

  TextStyle titleButtonStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.secondTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: appFont,
    );
  }

  TextStyle titleButtonPinkStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: appFont,
    );
  }

  TextStyle titleBoldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: appFont,
    );
  }

  TextStyle titleAppBarStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.thirdTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: appFont,
    );
  }

  TextStyle genaralTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: appFont,
    );
  }

  TextStyle genaralBlackTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.thirdTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: appFont,
    );
  }

  TextStyle secondTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: appFont,
    );
  }

  TextStyle bottomBarTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.menuTextColorLight,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      fontFamily: appFont,
    );
  }

// mini text
  TextStyle miniTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: CommonConstants.miniText,
      fontWeight: FontWeight.w500,
      fontFamily: appFont,
    );
  }

  // small text
  TextStyle smallTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: AppColor.fifthTextColorLight,
      fontSize: CommonConstants.smallText,
      fontWeight: FontWeight.w500,
      fontFamily: appFont,
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
      fontFamily: appFont,
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

  //medium text
  TextStyle mediumTextStype() {
    return const TextStyle(
      color: Colors.black,
      fontSize: CommonConstants.normalText,
      fontWeight: FontWeight.w500,
      fontFamily: appFont,
    );
  }

  //large text
  TextStyle largeTextStype() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return const TextStyle(
      color: Colors.black,
      fontSize: CommonConstants.largeText,
      fontWeight: FontWeight.w500,
      fontFamily: appFont,
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
