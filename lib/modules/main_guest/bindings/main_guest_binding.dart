import 'package:get/get.dart';
import '../../../base/base_binding.dart';

import '../controllers/main_guest_controller.dart';

class MainGuestBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MainGuestController>(() => MainGuestController());
  }
}
