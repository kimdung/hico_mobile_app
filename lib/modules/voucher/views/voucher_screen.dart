import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/voucher/voucher_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/voucher_controller.dart';

part 'voucher_components.dart';

class VoucherScreen extends GetView<VoucherController> {
  @override
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
            'booking.voucher_title'.tr,
            style: TextAppStyle()
                .titleAppBarStyle()
                .copyWith(color: AppColor.primaryColorLight),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('booking.voucher_sub_title'.tr,
                      style: TextAppStyle().smallTextBlack()),
                  Text(
                    '${'booking.voucher_approve'.tr}: 1',
                    style: TextAppStyle().smallTextBlack(),
                  )
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(
                    () => Column(
                      children: [
                        ...List.generate(
                            controller.voucherList.length,
                            (int index) =>
                                buidItem(item: controller.voucherList[index])),
                      ],
                    ),
                  ),
                ),

                // Obx(() => ListView.builder(
                //     controller: controller.scrollController,
                //     itemCount: controller.voucherList.length,
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return buidItem(item: controller.voucherList[index]);
                //     })),
              ),
              const SizedBox(height: 14),
              GeneralButton(
                onPressed: () {
                  controller.approve();
                },
                borderColor: AppColor.primaryColorLight,
                backgroundColor: AppColor.primaryColorLight,
                borderRadius: BorderRadius.circular(24),
                child: Text(
                  'Áp dụng',
                  style: TextAppStyle().titleButtonStyle(),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
