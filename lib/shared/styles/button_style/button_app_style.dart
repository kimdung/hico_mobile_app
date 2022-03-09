import 'package:flutter/material.dart';

class ButtonAppStyle {
  ButtonStyle buttonWrap() {
    return TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);
  }
}
