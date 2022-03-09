import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalIconStyle {
  Color? get iconTextColor => Get.theme.textTheme.headline2!.color;

  double? get size => 16;
}

class SmallIconStyle {
  Color? get iconTextColor => Get.theme.textTheme.headline6!.color;

  double? get size => 14;
}
