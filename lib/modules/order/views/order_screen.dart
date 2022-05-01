import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/invoice_status.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/order_controller.dart';

part 'order_extension.dart';

class OrderScreen extends GetView<OrderController> {
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
            'order.detail.title'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Obx(() => Container(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(120)),
                        child: (controller.invoice.value.supplierAvatar != null)
                            ? NetWorkImage(
                                image: controller.invoice.value.supplierAvatar!,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : FCoreImage(
                                ImageConstants.emptyImage,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (controller.invoice.value.status ==
                        InvoiceStatus.accepted.id)
                      buildActionButton(),
                    const SizedBox(height: 14),
                    buildOrderInfo(),
                    const SizedBox(height: 19),
                    Container(color: AppColor.greyBackgroundColor, height: 1),
                    const SizedBox(height: 18),
                    buildCustomerInfo(),
                    const SizedBox(height: 19),
                    Container(color: AppColor.greyBackgroundColor, height: 1),
                    const SizedBox(height: 18),
                    if (controller.invoice.value.service != null)
                      buildServiceInfo(),
                    const SizedBox(height: 19),
                    Container(color: AppColor.greyBackgroundColor, height: 1),
                    const SizedBox(height: 18),
                    buildWorkingTime(),
                    // const SizedBox(height: 19),
                    // Container(color: AppColor.greyBackgroundColor, height: 1),
                    // const SizedBox(height: 18),
                    // buildPaymentMethod(),
                    const SizedBox(height: 18),
                    Container(color: AppColor.greyBackgroundColor, height: 6),
                    const SizedBox(height: 14),
                    buildOrderDetail(),
                    if (controller.invoice.value.status ==
                        InvoiceStatus.canceled.id)
                      buildCancelReason(),
                    const SizedBox(height: 32),
                    buildActionBtnBottom(controller.invoice.value.status),
                    const SizedBox(height: 20),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
