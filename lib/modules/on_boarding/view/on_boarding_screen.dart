import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/carousel/slider_widget.dart';
import '../controller/on_boarding_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  ImageConstants.appLogo,
                  height: 42,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                  child: SingleChildScrollView(
                      child: buildSlider(controller.lstSlider))),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: GeneralButton(
                      onPressed: () => controller.login(),
                      borderRadius: BorderRadius.circular(24),
                      borderColor: AppColor.primaryColorLight,
                      backgroundColor: AppColor.primaryColorLight,
                      child: Text(
                        'login'.tr,
                        style: TextAppStyle().titleButtonStyle(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GeneralButton(
                      onPressed: () => controller.signup(),
                      borderRadius: BorderRadius.circular(24),
                      borderColor: AppColor.primaryColorLight,
                      borderWidth: 2,
                      child: Text(
                        'register'.tr,
                        style: TextAppStyle().titleButtonStyle().copyWith(
                              color: AppColor.primaryTextColorLight,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlider(List<SliderModel> promotions) {
    if (promotions.isNotEmpty) {
      return Container(
        child: SliderWidget(
          showIndicator: true,
          items: promotions
              .map((e) => SliderItem(
                    image: e.image!,
                    title: e.title ?? '',
                    description: e.description ?? '',
                  ))
              .toList(),
        ),
      );
    }
    return Container();
  }
}
