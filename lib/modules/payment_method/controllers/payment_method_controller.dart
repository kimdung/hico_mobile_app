import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';

class PaymentMethodController extends BaseController {
  Rx<int> paymentMethod = Rx<int>(0);
  double total = 0;

  PaymentMethodController() {
    var type = Get.arguments;
    if (type != null) {
      paymentMethod.value = type;
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> selected(int id) async {
    paymentMethod.value = id;
  }

  Future<void> approve() async {
    try {
      Get.back(result: paymentMethod.value);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {}
}
