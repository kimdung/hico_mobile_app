import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/account_controller.dart';

class AccountBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
