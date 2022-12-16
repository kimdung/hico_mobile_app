import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/home/slider_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/app_text_style.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/badge/badge_widget.dart';
import '../../../shared/widgets/carousel/slider_widget.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../shared/widgets/services_widget/service_item.dart';
import '../controllers/home_guest_controller.dart';

part 'home_guest_components.dart';

class HomeGuestScreen extends GetView<HomeGuestController> {
  @override
  final HomeGuestController controller;

  HomeGuestScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondBackgroundColorLight,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              buildHeaderBar(),
              Expanded(
                child: Container(
                  color: AppColor.primaryBackgroundColorLight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        buildSupplierList(
                            title: 'home.featured_supplier'.tr,
                            onPress: () {
                              controller.viewAllSuppliers();
                            },
                            list: controller.listSuppliers),
                        const SizedBox(height: 24),
                        if (controller.homeModel.value.bannerHome != null &&
                            controller.homeModel.value.bannerHome != '')
                          buildBannerHome(),
                        const SizedBox(height: 24),
                        // buildServiceList(
                        //     title: 'home.viewed_service'.tr,
                        //     onPress: () => Get.toNamed(Routes.RECENT_SERVICE),
                        //     list: controller.homeModel.value.serviceViews),
                        // const SizedBox(height: 24),
                        buildNewsList(),
                        const SizedBox(height: 37),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
