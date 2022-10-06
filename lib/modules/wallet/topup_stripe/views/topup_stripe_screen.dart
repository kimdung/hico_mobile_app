import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../../shared/widget_hico/widget_touch_hide_keyboard.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../call/pickup/picker_layout.dart';
import '../controllers/topup_stripe_controller.dart';

class TopupStripeScreen extends GetView<TopupStripeController> {
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
              'topup.stripe.title'.tr,
              style: TextAppStyle().titleAppBarStyle(),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
          ),
          body: WidgetTouchHideKeyBoard(
            child: Container(
              height: double.infinity,
              child: _buildBodyContent(),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: GeneralButton(
              onPressed: controller.onConfirm,
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              child: Text(
                'topup.confirm'.tr,
                style: TextAppStyle().titleButtonStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    // return CardFormField(
    //   controller: controller.cardEditController,
    //   onCardChanged: (card) {
    //     controller.card = card;
    //   },
    // );
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
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
              const SizedBox(height: 10),
              Form(
                key: controller.formState,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildInputAccountHolder(),
                      const SizedBox(height: 10),
                      _buildInputBankNumber(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildInputValidDate(),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: _buildInputCVC(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputAccountHolder() {
    return TextFormField(
      controller: controller.accountHolderController,
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'topup.card.name'.tr,
        hintStyle: TextAppStyle().genaralTextStyle(),
        errorStyle: const TextStyle(height: 0),
      ),
      validator: (name) => (name ?? '').isNotEmpty ? null : '',
      style: TextAppStyle().genaralTextStyle(),
    );
  }

  Widget _buildInputBankNumber() {
    return TextFormField(
      controller: controller.bankNumberController,
      keyboardType: TextInputType.number,
      cursorColor: Colors.grey,
      inputFormatters: [
        LengthLimitingTextInputFormatter(23),
      ],
      decoration: InputDecoration(
        hintText: 'topup.card.number'.tr,
        hintStyle: TextAppStyle().genaralTextStyle(),
        errorStyle: const TextStyle(height: 0),
      ),
      validator: (bankNumber) => (bankNumber ?? '').isNotEmpty ? null : '',
      style: TextAppStyle().genaralTextStyle(),
    );
  }

  Widget _buildInputValidDate() {
    return TextFormField(
      controller: controller.validDateController,
      keyboardType: TextInputType.datetime,
      cursorColor: Colors.grey,
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
      ],
      decoration: InputDecoration(
        hintText: 'topup.card.date'.tr,
        hintStyle: TextAppStyle().genaralTextStyle(),
        errorStyle: const TextStyle(height: 0),
      ),
      validator: (date) {
        // return (date ?? '').length == 5 ? null : ''; 
        final temps = date?.split('/');
        if (temps != null && temps.length == 2) {
          controller.expirationMonth = int.tryParse(temps[0]);
          controller.expirationYear = int.tryParse(temps[1]);
          return null;
        }
        return '';
      },
      style: TextAppStyle().genaralTextStyle(),
    );
  }

  Widget _buildInputCVC() {
    return TextFormField(
      controller: controller.cvvController,
      keyboardType: TextInputType.number,
      obscureText: true,
      cursorColor: Colors.grey,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
      ],
      decoration: InputDecoration(
        hintText: 'topup.card.cvc'.tr,
        hintStyle: TextAppStyle().genaralTextStyle(),
        errorStyle: const TextStyle(height: 0),
      ),
      validator: (cvc) => (cvc ?? '').length >= 3 ? null : '',
      style: TextAppStyle().genaralTextStyle(),
    );
  }
}
