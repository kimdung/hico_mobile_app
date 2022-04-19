import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/payment_method_controller.dart';

part 'payment_method_components.dart';

class PaymentMethodScreen extends GetView<PaymentMethodController> {
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
            'booking.payment_method'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Obx(() => Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 14),
                        buildRadioComponent(
                          type: PaymentMethod.Banking.index,
                          icon: IconConstants.icCard,
                          title: 'booking.payment_bank'.tr,
                          description: 'booking.payment_bank_description'.tr,
                        ),
                        const SizedBox(height: 14),
                        buildRadioComponent(
                          type: PaymentMethod.Online.index,
                          icon: IconConstants.icCardOnline,
                          title: 'booking.payment_online'.tr,
                          description: 'booking.payment_online_description'.tr,
                        ),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ),
                  GeneralButton(
                    onPressed: () {
                      controller.approve();
                    },
                    borderRadius: BorderRadius.circular(24),
                    borderColor: AppColor.primaryColorLight,
                    backgroundColor: AppColor.primaryColorLight,
                    child: Text(
                      'Xong',
                      style: TextAppStyle().titleButtonStyle(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            )),
      ),
    );
  }
}
