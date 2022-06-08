import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hico/shared/decoration/text_field_decoration.dart';

import '../../../data/app_data_global.dart';
import '../../call/pickup/picker_layout.dart';
import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../order/controllers/order_controller.dart';
import '../controllers/supplier_booking_controller.dart';

part 'supplier_booking_components.dart';

class SupplierBookingScreen extends GetView<SupplierBookingController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: true,
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
            'booking.title'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Obx(() => Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 14),
                      buildOrderInfo(),
                      const SizedBox(height: 19),
                      Container(color: AppColor.greyBackgroundColor, height: 1),
                      const SizedBox(height: 18),
                      buildCustomerInfo(),
                      const SizedBox(height: 19),
                      Container(color: AppColor.greyBackgroundColor, height: 1),
                      const SizedBox(height: 18),
                      buildServiceInfo(),
                      const SizedBox(height: 19),
                      Container(color: AppColor.greyBackgroundColor, height: 1),
                      const SizedBox(height: 18),
                      buildWorkingTime(),
                      const SizedBox(height: 19),
                      Container(color: AppColor.greyBackgroundColor, height: 1),
                      const SizedBox(height: 18),
                      buildVoucher(),
                      const SizedBox(height: 18),
                      Container(color: AppColor.greyBackgroundColor, height: 1),
                      const SizedBox(height: 18),
                      buildPaymentMethod(),
                      const SizedBox(height: 18),
                      Container(color: AppColor.greyBackgroundColor, height: 4),
                      const SizedBox(height: 14),
                      buildOrderDetail(),
                      const SizedBox(height: 20),
                      if (controller.bookingPrepare.value.supplierRequest!
                              .filterIsOnline! ==
                          CommonConstants.offline)
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  color: AppColor.greyBackgroundColor, height: 4),
                              const SizedBox(height: 14),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CommonConstants.paddingDefault),
                                child: _buildTitleSection(
                                    title: 'booking.your_address'.tr),
                              ),
                              //address
                              const SizedBox(height: 14),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CommonConstants.paddingDefault),
                                child: Column(
                                  children: [
                                    _buildInputAddressCode(),
                                    if (controller.showSuggest.value != 0)
                                      buildSuggestAddress(),
                                    const SizedBox(height: 16),
                                    _buildInputTemplate(
                                        textEditng: controller.province,
                                        focusNode: AlwaysDisabledFocusNode(),
                                        title: 'profile.update.provice'.tr),
                                    const SizedBox(height: 16),
                                    _buildInputTemplate(
                                        textEditng: controller.district,
                                        focusNode: AlwaysDisabledFocusNode(),
                                        title: 'profile.update.district'.tr),
                                    const SizedBox(height: 16),
                                    _buildInputTemplate(
                                        textEditng: controller.addressDetail,
                                        focusNode: AlwaysDisabledFocusNode(),
                                        title: 'profile.update.address'.tr),
                                    const SizedBox(height: 16),
                                    _buildInputTemplate(
                                        textEditng: controller.station,
                                        title: 'profile.station'.tr),
                                    const SizedBox(height: 16),
                                    _buildInputTextArea(
                                        textEditng: controller.address,
                                        title: 'booking.address_title'.tr),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CommonConstants.paddingDefault),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text: '${'note'.tr} ',
                                    style: TextAppStyle()
                                        .smallTextPink()
                                        .copyWith(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'booking.address_note'.tr,
                                        style: TextAppStyle().smallTextBlack(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GeneralButton(
                          borderRadius: BorderRadius.circular(24),
                          borderColor: AppColor.primaryColorLight,
                          backgroundColor: AppColor.primaryColorLight,
                          onPressed: () {
                            controller.booking();
                          },
                          child: Text(
                            'booking.booking'.tr,
                            style: TextAppStyle().titleButtonStyle(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
