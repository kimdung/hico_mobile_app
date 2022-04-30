import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/wallet/payment_method_item.dart';
import 'package:ui_api/models/wallet/topup_item.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/app_data_global.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';

class TopupController extends GetxController {
  final _uiRepository = Get.find<HicoUIRepository>();

  List<TopupItem> get topupItems => TopupItem.topupItems;
  RxInt selectedMoneyIndex = RxInt(0);

  final balance = RxInt(AppDataGlobal.userInfo?.accountBalance ?? 0);

  final formState = GlobalKey<FormState>();
  final moneyController = TextEditingController()
    ..text = TopupItem.topupItems.first.price.toString();

  RxInt selectedMethod = RxInt(0);
  List<PaymentMethodItem> get paymentMethods =>
      PaymentMethodItem.paymentMethods;

  @override
  void onClose() {
    printInfo(info: 'onClose');

    super.onClose();
  }

  /* Action */

  Future<void> onConfirm() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    final amount = double.tryParse(moneyController.text) ?? 0;
    if (amount == 0) {
      await EasyLoading.showToast('status'.tr);
      return;
    }

    switch (selectedMethod.value) {
      case 0:
        await _topupBank(amount);
        break;
      case 1:
        await _topupKomaju(amount, 1);
        break;
      case 2:
        await _topupKomaju(amount, 2);
        break;
      case 3:
        await Get.toNamed(Routes.TOPUP_STRIPE, arguments: amount);
        break;
      default:
        break;
    }
  }

  Future<void> onSelectTopup(int index) async {
    selectedMoneyIndex.value = index;
    moneyController.text = topupItems[index].price.toString();
  }

  Future<void> onSelectPaymentMethod(int index) async {
    selectedMethod.value = index;
  }

  /* API */

  Future<void> _topupBank(double amount) async {
    try {
      await EasyLoading.show();
      await _uiRepository.topupBank(amount).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.row != null) {
          Get.toNamed(Routes.TOPUP_BANK, arguments: response.data!.row);
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _topupKomaju(double amount, int type) async {
    try {
      await EasyLoading.show();
      await _uiRepository.topupKomaju(amount, type).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          // _payment(response.data!);
          Get.toNamed(Routes.TOPUP_KOMOJU, arguments: response.data!);
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
