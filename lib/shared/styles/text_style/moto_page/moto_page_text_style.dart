part of '../text_style.dart';

extension MotoPageStyle on TextAppStyle {
  TextStyle textPricePageMotoStyle() {
    return TextStyle(
      color: AppColor.fourthTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textTitlePageMotoStyle() {
    return TextStyle(
      color: AppColor.fourthTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }
}
