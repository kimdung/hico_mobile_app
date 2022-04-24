import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/wallet/payment_method_item.dart';
import 'package:ui_api/models/wallet/topup_item.dart';

import '../../../../routes/app_pages.dart';

class TopupController extends GetxController {
  List<TopupItem> get topupItems => TopupItem.topupItems;
  RxInt selectedMoneyIndex = RxInt(0);

  final balance = RxDouble(200000);

  final formState = GlobalKey<FormState>();
  final moneyController = TextEditingController()
    ..text = TopupItem.topupItems.first.price.toString();

  RxInt selectedMethod = RxInt(0);
  List<PaymentMethodItem> get paymentMethods =>
      PaymentMethodItem.paymentMethods;

  /* Action */

  Future<void> onConfirm() async {
    switch (selectedMethod.value) {
      case 0:
        await Get.toNamed(Routes.TOPUP_BANK, arguments: '00000001');
        break;
      case 1:
        break;
      case 2:
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
}
