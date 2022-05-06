import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/decoration/text_field_decoration.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../call/pickup/picker_layout.dart';
import '../controllers/topup_bank_controller.dart';

class TopupBankScreen extends GetView<TopupBankController> {
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
                'topup.bank.info'.tr,
                style: TextAppStyle().titleAppBarStyle(),
              ),
              elevation: 1,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: _buildBodyContent(),
            )),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBankContent(),
        _buildTransferContent(),
        _buildNote(),
        _buildImageBill(),
        _buildConfimButton(),
      ],
    );
  }

  Widget _buildBankContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 18, 20, 8),
          child: Text(
            'topup.bank.info'.tr,
            style: TextAppStyle().titleStyle().copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _buildBankCell(controller.banks[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: controller.banks.length),
      ],
    );
  }

  Widget _buildBankCell(BankModel bank) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
          Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: AppColor.secondBackgroundColorLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'topup.bank.number'.trArgs([bank.accountNumber ?? '']),
                    style: TextAppStyle().titleStyle(),
                  ),
                ),
                IconButton(
                  onPressed: () => controller.onCopy(bank),
                  icon: FCoreImage(IconConstants.icCopy1),
                )
              ],
            ),
          ),
          const SizedBox(height: 14),
          _buildBankInfo('bank'.tr, bank.name ?? ''),
          Divider(
            height: 24,
            color: AppColor.dividerColorLight.withOpacity(0.2),
          ),
          _buildBankInfo('branch'.tr, bank.branch ?? ''),
          Divider(
            height: 24,
            color: AppColor.dividerColorLight.withOpacity(0.2),
          ),
          _buildBankInfo('account_holder'.tr, bank.accountHolder ?? ''),
        ],
      ),
    );
  }

  Widget _buildBankInfo(String title, String info) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Text(
            title,
            style: TextAppStyle().smallTextGrey(),
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: TextAppStyle()
                .smallTextBlack()
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildTransferContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 18, 20, 0),
          child: Text(
            'topup.bank.content.title'.tr,
            style: TextAppStyle().titleStyle().copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 20, 8),
          child: Text(
            'topup.bank.content.cap'.tr,
            style: TextAppStyle().smallTextGrey(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: AppColor.secondBackgroundColorLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'topup.bank.content'
                            .trArgs([controller.topup.code ?? '']),
                        style: TextAppStyle().titleStyle(),
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.onCopyTransferContent(),
                      icon: FCoreImage(IconConstants.icCopy1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 14),
              RichText(
                text: TextSpan(
                  text: '',
                  style: TextAppStyle().smallTextGrey(),
                  children: <TextSpan>[
                    TextSpan(
                      text: '* ',
                      style: TextAppStyle()
                          .smallTextGrey()
                          .copyWith(color: AppColor.redTextColor),
                    ),
                    TextSpan(
                      text: 'topup.bank.content.note'.tr,
                    ),
                    TextSpan(
                      text: ' *',
                      style: TextAppStyle()
                          .smallTextGrey()
                          .copyWith(color: AppColor.redTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNote() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
          RichText(
            text: TextSpan(
              text: 'comment'.tr,
              style: TextAppStyle().titleStyle().copyWith(
                    fontSize: 16,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: ' *',
                  style: TextAppStyle().titleStyle().copyWith(
                        color: AppColor.redTextColor,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: TextField(
              controller: controller.noteController,
              keyboardType: TextInputType.text,
              cursorColor: AppColor.fifthTextColorLight,
              maxLines: 4,
              decoration: TextFieldDecoration.borderOutline(
                backgroundColor: AppColor.primaryBackgroundColorLight,
                borderColor: AppColor.borderPinkColorLight,
                radius: 6,
              ),
              style: TextAppStyle().normalTextStype(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageBill() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
          RichText(
            text: TextSpan(
              text: 'topup.bank.bill'.tr,
              style: TextAppStyle().titleStyle().copyWith(
                    fontSize: 16,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: ' *',
                  style: TextAppStyle().titleStyle().copyWith(
                        color: AppColor.redTextColor,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: controller.onSelectImageBill,
            child: Obx(
              () => controller.imageBill.value != null
                  ? Image.file(
                      File(controller.imageBill.value!.path),
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColor.secondBackgroundColorLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            FCoreImage(
                              IconConstants.icCamera,
                              width: 20,
                            ),
                            Text(
                              'camera'.tr,
                              style: TextAppStyle().smallTextPink(),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfimButton() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      child: GeneralButton(
        onPressed: controller.onConfirm,
        borderRadius: BorderRadius.circular(24),
        borderColor: AppColor.primaryColorLight,
        backgroundColor: AppColor.primaryColorLight,
        child: Text(
          'confirm'.tr,
          style: TextAppStyle().titleButtonStyle(),
        ),
      ),
    );
  }
}
