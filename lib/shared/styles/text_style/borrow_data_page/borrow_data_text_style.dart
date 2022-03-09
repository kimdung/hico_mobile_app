part of '../text_style.dart';

extension BorrowDataStyle on TextAppStyle {
  TextStyle textDisableButtonDataStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textTitleDataStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textTitleButtonDataStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textSubTitleButtonDataStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }
}
