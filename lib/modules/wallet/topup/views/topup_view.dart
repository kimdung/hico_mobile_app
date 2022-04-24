import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';

import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/topup_controller.dart';

class TopupView extends GetView<TopupController> {
  @override
  final TopupController controller;

  TopupView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyContent(),
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
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInputTopup(),
          _buildPaymentMethod(),
        ],
      ),
    );
  }

  Widget _buildInputTopup() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.secondBackgroundColorLight,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                FCoreImage(
                  IconConstants.icWallet1,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'topup.balance'.tr,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: AppColor.fifthTextColorLight,
                      ),
                ),
                Obx(
                  () => Text(
                    '${controller.balance} JPY',
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: AppColor.thirdTextColorLight,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 12),
              crossAxisCount: 4,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: (Get.width - 84) / 4 / 40,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                ...List.generate(
                    controller.topupItems.length,
                    (index) => _buildMoneyCell(
                        index, controller.selectedMoneyIndex.value)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: AppColor.borderPinkBoldColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'topup.amount'.tr,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: AppColor.sixTextColorLight,
                      ),
                ),
                Form(
                  key: controller.formState,
                  child: TextFormField(
                    controller: controller.moneyController,
                    cursorColor: AppColor.fifthTextColorLight,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'topup.amount.hint'.tr,
                      hintStyle: TextAppStyle().normalTextGrey(),
                      border: InputBorder.none,
                    ),
                    style: TextAppStyle().normalTextStype(),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'data_requied'.tr
                        : null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'topup.method.title'.tr,
              style: TextAppStyle().genaralTextStyle().copyWith(
                    color: AppColor.thirdTextColorLight,
                  ),
            ),
          ),
          Obx(
            () {
              final selectedMethod = controller.selectedMethod.value;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, index) =>
                    _buildPaymentMethodCell(index, selectedMethod),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMoneyCell(int index, int selectedIndex) {
    return InkWell(
      onTap: () => controller.onSelectTopup(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == selectedIndex
              ? AppColor.primaryColorLight
              : AppColor.greyBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          controller.topupItems[index].title,
          style: TextAppStyle().genaralTextStyle().copyWith(
                color: index == selectedIndex
                    ? AppColor.secondTextColorLight
                    : AppColor.sixTextColorLight,
              ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCell(int index, int selectedMethod) {
    final paymentMethod = controller.paymentMethods[index];
    return InkWell(
      onTap: () => controller.onSelectPaymentMethod(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            FCoreImage(
              index == selectedMethod
                  ? IconConstants.icRadioSelected
                  : IconConstants.icRadioUnselect,
              width: 16,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FCoreImage(
                        paymentMethod.icon,
                        height: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        paymentMethod.title.tr,
                        style: TextAppStyle().genaralTextStyle().copyWith(
                              color: AppColor.fifthTextColorLight,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    paymentMethod.description.tr,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: AppColor.fifthTextColorLight,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
