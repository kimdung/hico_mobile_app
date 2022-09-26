import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class OnBoardingController extends BaseController {
  OnBoardingController() {
    final error = Get.arguments;
    if (error is String && error.isNotEmpty) {
      EasyLoading.showToast(error);
    }
  }

  @override
  Future<void> onInit() async {
    final error = Get.arguments;
    if (error is String && error.isNotEmpty) {
      await EasyLoading.showToast(error);
    }
    await super.onInit();
  }

  final lstSlider = [
    SliderModel(
        title: 'onboard.title1'.tr,
        image: 'lib/resource/assets_resources/images/slider.png',
        description: 'onboard.description1'.tr),
    SliderModel(
        title: 'onboard.title2'.tr,
        image: 'lib/resource/assets_resources/images/slider2.png',
        description: 'onboard.description2'.tr),
    SliderModel(
        title: 'onboard.title3'.tr,
        image: 'lib/resource/assets_resources/images/slider3.png',
        description: 'onboard.description3'.tr),
  ];

  final Rx<int> sliderCurrentIndex = Rx(0);
  final RxList<String> promotions =
      RxList.generate(3, (index) => ImageConstants.sliderDemo);

  Future<void> login() async {
    await Get.toNamed(Routes.LOGIN);
  }

  Future<void> signup() async {
    await Get.toNamed(Routes.REGISTER);
  }
}

class SliderModel {
  String? image;
  String? title;
  String? description;

  SliderModel({
    this.image,
    this.title,
    this.description,
  });
}
