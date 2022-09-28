import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:ui_api/models/wallet/topup_history_model.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../call/pickup/picker_layout.dart';
import '../controllers/topup_detail_controller.dart';

class TopupDetailScreen extends GetView<TopupDetailController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: SvgPicture.asset(IconConstants.icBack, width: 11),
              onPressed: Get.back,
            ),
            title: Text(
              'topup.detail.title'.tr,
              style: TextAppStyle().titleAppBarStyle(),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
          ),
          body: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopupContent(),
          (controller.topup?.image?.isEmpty ?? true)
              ? Container()
              : _buildImageBill(),
          Container(
            padding: const EdgeInsets.all(20),
            child: GeneralButton(
              onPressed: controller.onTopup,
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              child: Text(
                'back_home'.tr,
                style: TextAppStyle().titleButtonStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopupContent() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.primaryBackgroundColorLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColorLight,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              FCoreImage(
                IconConstants.icTopupWallet,
                width: 32,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'topup.wallet'.tr,
                    style: TextAppStyle().titleStyle(),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'topup.code'.tr,
                      style: TextAppStyle().smallTextGrey(),
                      children: <TextSpan>[
                        TextSpan(
                          text: controller.topup?.code ?? '',
                          style: TextAppStyle()
                              .smallTextGrey()
                              .copyWith(color: AppColor.primaryTextColorLight),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          _buildStatus(),
          const SizedBox(height: 8),
          _buildContent(
              'topup.money'.tr, '${controller.topup?.amount ?? 0} JPY',
              valueColor: AppColor.primaryTextColorLight),
          const Divider(),
          _buildContent('topup.date'.tr, controller.topup?.createdAt ?? ''),
          const Divider(),
          _buildContent('topup.method'.tr, controller.topup?.getMethod() ?? ''),
          const Divider(),
          _buildContent('topup.note'.tr, controller.topup?.note ?? ''),
        ],
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: controller.topup?.status == TopupHistoryModel.CONFIRMED
            ? AppColor.greenTextColor.withOpacity(0.2)
            : AppColor.primaryColorLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            controller.topup?.status == TopupHistoryModel.CONFIRMED
                ? Icons.check_circle_sharp
                : Icons.cancel,
            color: controller.topup?.status == TopupHistoryModel.CONFIRMED
                ? AppColor.greenTextColor
                : AppColor.primaryColorLight,
            size: 15,
          ),
          const SizedBox(width: 8),
          Text(
            controller.topup?.getStatus() ?? '',
            style: TextAppStyle().genaralTextStyle().copyWith(
                  color: AppColor.thirdTextColorLight,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(String title, String value, {Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextAppStyle().smallTextGrey(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              style: TextAppStyle()
                  .smallTextGrey()
                  .copyWith(fontSize: 14, color: valueColor),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageBill() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        color: AppColor.primaryBackgroundColorLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColor.dividerColorLight.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'topup.bank.bill'.tr,
            style: TextAppStyle().titleStyle().copyWith(
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 8),
          Image.network(
            controller.topup?.image ?? '',
            width: double.infinity,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, stackTrace) {
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
