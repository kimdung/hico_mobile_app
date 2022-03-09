import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';

PreferredSizeWidget appbar(BuildContext context,
    {String title = APP_NAME, IconButton? leadingIcon}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamily: TextAppStyle.appFont,
        color: Colors.white,
      ),
    ),
    elevation: 0,
    brightness: Brightness.dark,
    flexibleSpace: Container(
      color: AppColor.eightTextColorLight,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //     colors: [
      //       AppColor.color45C152,
      //       AppColor.color0ADC90,
      //     ],
      //   ),
      // ),
    ),
    centerTitle: true,
    leading: leadingIcon ??
        IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
    // actions: [
    //   IconButton(
    //     icon: const Icon(
    //       Icons.notifications,
    //       color: Colors.white,
    //     ),
    //     onPressed: () {
    //       // Get.toNamed(Routes.NOTIFICATION_SCREEN);
    //     },
    //   ),
    //   IconButton(
    //     icon: FCoreImage(
    //       IconConstants.menu,
    //       fit: BoxFit.fitHeight,
    //     ),
    //     onPressed: () {
    //       // Get.toNamed(Routes.YOUR_PRODUCT_SCREEN);
    //     },
    //     color: Colors.white,
    //   ),
    // ],
  );
}
