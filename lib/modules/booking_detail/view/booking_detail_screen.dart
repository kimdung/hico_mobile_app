import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/invoice_status.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../../order/controllers/order_controller.dart';
import '../controller/booking_detail_controller.dart';

part 'booking_detail_children.dart';

class BookingDetailScreen extends GetView<BookingDetailController> {
  const BookingDetailScreen({Key? key}) : super(key: key);

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
            'extend.title.appbar'.tr,
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
                    const SizedBox(height: 19),
                    Container(color: AppColor.greyBackgroundColor, height: 1),
                    const SizedBox(height: 18),
                    buildPaymentMethod(),
                    const SizedBox(height: 18),
                    Container(color: AppColor.greyBackgroundColor, height: 6),
                    const SizedBox(height: 14),
                    buildOrderDetail(),       
                    const SizedBox(height: 32),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: CommonConstants.paddingDefault),
                    child: GeneralButton(
                        onPressed: () {
                          controller.onSubmit();
                        },
                        borderRadius: BorderRadius.circular(24),
                        borderColor: AppColor.primaryColorLight,
                        backgroundColor: AppColor.primaryColorLight,
                        child: Text(
                          'extend.title.button'.tr,
                          style: TextAppStyle().normalTextWhite(),
                        ),
                    ),),

                    const SizedBox(height: 20),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}