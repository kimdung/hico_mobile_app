import 'package:get/get.dart';

import '../../../base/base_binding.dart';
import '../controllers/bank_controller.dart';

class BankBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<BankController>(() => BankController());
  }
}
