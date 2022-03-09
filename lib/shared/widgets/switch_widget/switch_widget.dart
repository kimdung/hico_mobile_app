import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    required this.value,
    required this.onChanged,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
  });

  final bool value;
  final Function(bool) onChanged;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      activeColor: Get.theme.primaryColor,
      activeTrackColor: Get.theme.accentColor,
      inactiveTrackColor: inactiveTrackColor ?? Get.theme.disabledColor,
      inactiveThumbColor: inactiveThumbColor ?? Get.theme.primaryColor,
      onChanged: onChanged,
    );
  }
}
