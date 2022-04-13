import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/app_text_style.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/button_scale.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widget_hico/order_widget/item_order_widget.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/order_list_controller.dart';

part 'order_list_body.dart';

class OrderListScreen extends GetView<OrderListController> {
  @override
  final OrderListController controller;
  OrderListScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: AppColor.secondBackgroundColorLight,
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),
                _buildHeaderBar(),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    color: AppColor.primaryBackgroundColorLight,
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Container(
                              color: AppColor.secondBackgroundColorLight,
                            ),
                          ),
                          Container(
                              color: AppColor.secondBackgroundColorLight,
                              child: _buildSearchField()),
                          _buildOrderStatus(),
                          _buildListOrder(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
