import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/account/controllers/account_controller.dart';

class AccountBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
