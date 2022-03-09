import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../constants/colors.dart';

class ContainerAppStyle {
  BoxDecoration enableBox() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryBackgroundColorLight,
        border: Border.all(
            width: 1, color: AppColor.primaryHintColorLight.withOpacity(0.2)));
  }

  BoxDecoration disableBox() {
    return BoxDecoration(
      color: AppColor.eightTextColorLight,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
