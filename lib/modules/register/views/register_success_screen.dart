import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/register_controller.dart';

class RegisterSuccessScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: FCoreImage(
                  ImageConstants.registerSuccess,
                  fit: BoxFit.fill,
                  width: Get.width * 0.5,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'register'.tr,
                              style: TextAppStyle().genaralTextStyle().copyWith(
                                    color: AppColor.fifthTextColorLight,
                                    fontSize: 18,
                                  ),
                            ),
                            Container(
                              child: Text(
                                'success'.tr,
                                style:
                                    TextAppStyle().genaralTextStyle().copyWith(
                                          color: AppColor.primaryTextColorLight,
                                          fontSize: 24,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonConstants.paddingDefault),
                child: GeneralButton(
                  onPressed: () {
                    controller.onLogin();
                  },
                  borderRadius: BorderRadius.circular(24),
                  backgroundColor: AppColor.primaryColorLight,
                  borderColor: AppColor.primaryColorLight,
                  child: Text(
                    'login'.tr,
                    style: TextAppStyle().titleButtonStyle(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
