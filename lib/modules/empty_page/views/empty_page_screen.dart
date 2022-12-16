import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../controllers/empty_page_controller.dart';

class EmptyPageScreen extends GetView<EmptyPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'home.notification'.tr,
          style: TextAppStyle()
              .titleAppBarStyle()
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'login.required'.tr,
              textAlign: TextAlign.center,
              style: TextAppStyle().normalTextStype(),
            ),
            const SizedBox(height: 30),
            GeneralButton(
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text(
                'login'.tr,
                style: TextAppStyle().normalTextWhite(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
