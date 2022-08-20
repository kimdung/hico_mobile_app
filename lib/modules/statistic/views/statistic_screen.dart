import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/statistic/statistic_invoice_model.dart';

import '../../call/pickup/picker_layout.dart';
import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/statistic_controller.dart';

part 'statistic_extension.dart';

class StatisticScreen extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              IconConstants.icBack,
              width: 11,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'statistic'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildStatusNavBar(),
                buildTotalWithStatus(),
                Obx(() => controller.indexStatus.value == 0
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          buildSearchField(),
                          const SizedBox(height: 20),
                          buildSearchDate(context),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'statistic.order_finish'.tr,
                              style: TextAppStyle().genaralTextStyle().copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 16),
                          buildOrderList(),
                        ],
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
