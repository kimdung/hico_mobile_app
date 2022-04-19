import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/config_controller.dart';

class BankScreen extends GetView<ConfigController> {
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
            'bank_info'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: CommonConstants.paddingDefault),
          child: Column(
            children: [
              const SizedBox(height: 24),
              ...List.generate(
                AppDataGlobal.masterData!.banks!.length,
                (index) => buildItem(
                  bank: AppDataGlobal.masterData!.banks![index],
                ),
              ),
            ],
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
          const SizedBox(
            height: 5,
          ),
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
        ],
      ),
    );
  }
}
