import 'package:flutter/material.dart';

class AppColor {
  AppColor();

  /// Light Color
  static Color defaultHeaderOSColorLight =
      const Color(0xFFFFEFF4); // light pink
  static Color primaryColorLight = const Color(0xFFDF4D6F); // dark pink
  static Color accentColorLight = const Color(0xFFFFFFFF); // white
  static Color dividerColorLight = const Color(0xFF959595); // grey
  static Color secondColorLight = const Color(0xFFFF7DA5); // light pink
  static Color onlineColor = const Color(0xFF27AE60); // green
  static Color offlineColor = const Color(0xFF2D9CDB); // blue
  static Color greenColorLight = const Color(0xFF27AE60);
  static Color blueColorLight = const Color(0xFF2D9CDB);
  static Color appbarColorLight = const Color(0xFFE5E5E5);
  static Color borderGrayColorLight = const Color(0xFFB8B8B8);
  static Color borderPinkColorLight = const Color(0xFFFFBED2);
  static Color borderPinkBoldColor = const Color(0xFFFF9EBC);

  //Text
  static Color primaryTextColorLight = const Color(0xFFDF4D6F); // pink
  static Color secondTextColorLight = const Color(0xFFFFFFFF); // white
  static Color thirdTextColorLight = const Color(0xFF000000); // black
  static Color fourthTextColorLight = const Color(0xFF4E4E4E); // light gray
  static Color fifthTextColorLight = const Color(0xFF888888); // gray
  static Color sixTextColorLight = const Color(0xFF717171); // gray
  static Color sevenTextColorLight = const Color(0xFF1B1B1E); // gray
  static Color eightTextColorLight = const Color(0xFF3B3B3B); // green
  static Color niceTextColorLight = const Color(0xFF3B3B3B);
  static Color menuTextColorLight = const Color(0xFFB8B8B8);
  static Color textBlack = const Color(0xff333333);
  static Color blueTextColor = const Color(0xFF007AFF);
  static Color redTextColor = const Color(0xFFFF2323);
  static Color greenTextColor = const Color(0xFF34C759);

  //Hint
  static Color primaryHintColor = const Color(0xffFF6B6B);
  static Color primaryHintColorLight = const Color(0xFF888888); // gray

  static Color primaryBorderColorLight = const Color(0xFFF0F0F0); // gray
  static Color primarySelectedColorLight = const Color(0xFFADADAD); // gray

  //backround
  static Color primaryBackgroundColorLight = const Color(0xFFFFFFFF);
  static Color secondBackgroundColorLight = const Color(0xFFFFEFF4);
  static Color greyBackgroundColor = const Color(0xFFEEEEEE);

  static Color errorColor = const Color(0xFFEE0707);
  static Color disabledColorLight = const Color(0xFFADADAD); // gray
  static Color cursorColor = const Color(0xff333333);
  static Color shadowColorLight = const Color(0xFFE5E5E5); // black26

  static const Color colorFF7AA3 = Color(0xFFFF7AA3);
  static const Color colorFF4880 = Color(0xFFFF4880);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
