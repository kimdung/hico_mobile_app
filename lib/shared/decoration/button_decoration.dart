import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ButtonDecoration {
  ButtonDecoration._();

  static BoxDecoration borderButton({Color borderColor = Colors.grey}) {
    return BoxDecoration(
      border: Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
