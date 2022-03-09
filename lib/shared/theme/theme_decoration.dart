import 'package:flutter/material.dart';
import '../constants/colors.dart';

// ignore: avoid_classes_with_only_static_members
class ThemeDecoration {
  static BoxDecoration get appGradient => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColor.color45C152,
            AppColor.color0ADC90,
          ],
          // stops: [
          //   0.0,
          //   1.0,
          // ],
        ),
      );

  static BoxDecoration get textShadow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.2),
          ],
        ),
      );

  static BoxDecoration get textFieldWithShadow => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      );

  static BoxDecoration get promotion => BoxDecoration(
        color: const Color(0xCCFFFFFF),
        // borderRadius: const BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      );

  static InputDecoration get inputNoneBorder => const InputDecoration(
        border: InputBorder.none,
      );
  static TextStyle get textLabelForm => const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: AppColor.textBlack,
      height: 1.2);

  static TextStyle get labelStyleGrayColor => const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: AppColor.gray1,
      height: 1.2);
}
