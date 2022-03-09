import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/shared/widget_hico/box_decoration/box_decoration.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/home/slider_model.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/app_text_style.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/carousel/slider_widget.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../shared/widgets/services_widget/service_item.dart';
import '../controllers/home_controller.dart';

part 'home_components.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller;
  HomeScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColor.primaryBackgroundColorLight,
      child: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                buildHeaderBar(),
                const SizedBox(height: 20),
                if (controller.homeModel.value.sliders != null)
                  buildSlider(controller.homeModel.value.sliders!),
                const SizedBox(height: 20),
                buildServiceCategories(
                  title: 'home.service_categories'.tr,
                ),
                const SizedBox(height: 24),
                buildServiceList(
                    title: 'home.new_service'.tr,
                    onPress: () => Get.toNamed(Routes.NEW_SERVICE),
                    list: controller.homeModel.value.services),
                const SizedBox(height: 24),
                if (controller.homeModel.value.bannerHome != null &&
                    controller.homeModel.value.bannerHome != '')
                  buildBannerHome(),
                const SizedBox(height: 24),
                buildNewsList(),
                const SizedBox(height: 24),
                buildServiceList(
                    title: 'home.viewed_service'.tr,
                    onPress: () => Get.toNamed(Routes.RECENT_SERVICE),
                    list: controller.homeModel.value.serviceViews),
                const SizedBox(height: 37),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
