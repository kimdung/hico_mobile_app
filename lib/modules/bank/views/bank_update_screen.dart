import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/bank_controller.dart';

part 'bank_update_extension.dart';

class BankUpdateScreen extends GetView<BankController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'booking.bank_update'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                color: AppColor.greyBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: FCoreImage(IconConstants.icProfileBank)),
                    Expanded(
                      child: Text(
                        'booking.bank_update_title'.tr,
                        style: TextAppStyle().smallTextBlack(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.formBank,
                      child: Column(
                        children: [
                          //bank
                          buildSelectComponent(
                            title: controller.bankName.value != ''
                                ? controller.bankName.value
                                : 'profile.update.bank_name'.tr,
                            textColor: TextAppStyle().smallTextGrey(),
                            prefixIcon: true,
                            prefixImage:
                                'lib/resource/assets_resources/icons/keyboard_arrow_down_grey.png',
                            onPress: () => controller.getBank(context),
                          ),
                          //_buildInputBankName(),
                          const SizedBox(height: 16),
                          _buildInputBranchName(),
                          const SizedBox(height: 16),
                          _buildInputBankAccount(),
                          const SizedBox(height: 16),
                          _buildInputBankNumber(),
                          const SizedBox(height: 16),

                          //button
                          const SizedBox(height: 30),
                          GeneralButton(
                            onPressed: () {
                              controller.updated();
                            },
                            borderRadius: BorderRadius.circular(24),
                            borderColor: AppColor.primaryColorLight,
                            backgroundColor: AppColor.primaryColorLight,
                            child: Text(
                              'save'.tr,
                              style: TextAppStyle().titleButtonStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 30),
            ],
          ),
        )),
      ),
    );
  }
}
