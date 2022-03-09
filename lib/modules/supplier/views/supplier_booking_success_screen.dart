import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hico/resource/assets_constant/images_constants.dart';
import 'package:hico/shared/widget_hico/button/general_button.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/supplier_booking_success_controller.dart';

class SupplierBookingSuccessScreen
    extends GetView<SupplierBookingSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.paddingDefault),
            child: Column(
              children: [
                const SizedBox(height: 35),
                FCoreImage(
                  ImageConstants.registerSuccess,
                  fit: BoxFit.fill,
                  width: 150,
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'booking.success'.tr,
                                style: TextAppStyle().normalTextStype(),
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'success'.tr,
                                    style: TextAppStyle().largeTextPink(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    strokeWidth: 2,
                    type: GFBorderType.rect,
                    color: AppColor.primaryColorLight,
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '${'note'.tr} ',
                          style: TextAppStyle().smallTextPink().copyWith(
                              color: Colors.red, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'booking.note'.tr,
                              style: TextAppStyle().smallTextBlack(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 31),
                Container(color: AppColor.greyBackgroundColor, height: 4),
                ...List.generate(
                  AppDataGlobal.masterData!.banks!.length,
                  (index) => buildItem(
                    bank: AppDataGlobal.masterData!.banks![index],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('booking.code'.tr,
                              style: TextAppStyle().normalTextPink()),
                          const SizedBox(width: 12),
                          Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.code,
                                    style: TextAppStyle().smallTextGrey(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: controller.code));
                                    },
                                    child: FCoreImage(IconConstants.icCopy),
                                  )
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(height: 47),
                      GeneralButton(
                        onPressed: () {
                          controller.goHome();
                        },
                        borderRadius: BorderRadius.circular(24),
                        borderColor: AppColor.primaryColorLight,
                        backgroundColor: AppColor.primaryColorLight,
                        child: Text(
                          'back_home'.tr,
                          style: TextAppStyle().titleButtonStyle(),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildItem({required BankModel bank}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bank.name!, style: TextAppStyle().normalTextPink()),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'branch'.tr,
                    style: TextAppStyle().smallTextBlack(),
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    bank.branch!,
                    style: TextAppStyle().smallTextGrey(),
                  )),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'account_holder'.tr,
                    style: TextAppStyle().smallTextBlack(),
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    bank.accountHolder!,
                    style: TextAppStyle().smallTextGrey(),
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('account_number'.tr,
                      style: TextAppStyle().smallTextBlack())),
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bank.accountNumber!,
                        style: TextAppStyle().smallTextGrey(),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: bank.accountNumber!));
                        },
                        child: FCoreImage(IconConstants.icCopy),
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 10),
          Container(color: AppColor.greyBackgroundColor, height: 2),
        ],
      ),
    );
  }
}
