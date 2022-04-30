import 'package:get/get.dart';

import '../controllers/topup_bank_controller.dart';

class TopupBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupBankController>(
      () => TopupBankController(Get.arguments),
    );
  }
}
