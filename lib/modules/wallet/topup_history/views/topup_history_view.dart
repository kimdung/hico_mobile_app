import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/models/wallet/topup_history_model.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/topup_history_controller.dart';

class TopupHistoryView extends GetView<TopupHistoryController> {
  @override
  final TopupHistoryController controller; 

  TopupHistoryView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.topupHistories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              _buildTopupHistoryCell(controller.topupHistories[index]),
        );
      }),
    );
  }

  Widget _buildTopupHistoryCell(TopupHistoryModel topupHistory) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FCoreImage(
            IconConstants.icWallet1,
            width: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${topupHistory.amount} JPY',
                        style: TextAppStyle().titleStyle(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      topupHistory.status == TopupHistoryModel.CONFIRMED
                          ? 'topup.confirmed'.tr
                          : 'topup.waitting'.tr,
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            color: topupHistory.status ==
                                    TopupHistoryModel.CONFIRMED
                                ? AppColor.greenTextColor
                                : AppColor.primaryColorLight,
                          ),
                    ),
                  ],
                ),
                Text(
                  topupHistory.createdAt ?? '',
                  style: TextAppStyle().genaralTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
