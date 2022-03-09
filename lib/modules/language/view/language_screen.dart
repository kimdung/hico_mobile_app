import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/language_controller.dart';

class LanguageScreen extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.accentColorLight,
        centerTitle: true,
        title: Text(
          'choose_language'.tr,
          style: TextStyle(color: AppColor.thirdTextColorLight),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: CommonConstants.paddingDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: CommonConstants.paddingDefault),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLanguageItem(
                        icon: ImageConstants.japanFlag,
                        title: '日本語',
                        code: LanguageCode.JA,
                        onPress: () => {
                          controller.currentLanguage.value = LanguageCode.JA
                        },
                      ),
                      buildLanguageItem(
                        icon: ImageConstants.vietnamFlag,
                        title: 'Tiếng Việt',
                        code: LanguageCode.VN,
                        onPress: () => {
                          controller.currentLanguage.value = LanguageCode.VN
                        },
                      ),
                      buildLanguageItem(
                        icon: ImageConstants.ukFlag,
                        title: 'Enghlish',
                        code: LanguageCode.EN,
                        onPress: () => {
                          controller.currentLanguage.value = LanguageCode.EN
                        },
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: GeneralButton(
                onPressed: () => controller.confirmLanguage(),
                borderRadius: BorderRadius.circular(24),
                borderColor: AppColor.primaryColorLight,
                backgroundColor: AppColor.primaryColorLight,
                child: Text(
                  'continue'.tr,
                  style: TextAppStyle()
                      .titleButtonStyle()
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildLanguageItem(
      {required String icon,
      required String title,
      Function()? onPress,
      LanguageCode? code}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: (Get.width - 40) * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
            color: AppColor.primaryBackgroundColorLight,
            border: Border.all(
              width: 2.5,
              color: controller.currentLanguage.value == code
                  ? AppColor.primaryColorLight.withOpacity(0.8)
                  : Colors.white,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                  color: AppColor.shadowColorLight)
            ]),
        child: Column(
          children: [
            FCoreImage(icon),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextAppStyle()
                  .genaralTextStyle()
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
