part of '../text_style.dart';

extension HomePageStyle on TextAppStyle {
  TextStyle textTitlePageHomeStyle() {
    return TextStyle(
      color: AppColor.fourthTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textTitleCardPageHomeStyle() {
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textUserNamePageHomeStyle() {
    return TextStyle(
      color: AppColor.secondTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textPhonePageHomeStyle() {
    return TextStyle(
      color: AppColor.secondTextColorLight,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }
}
