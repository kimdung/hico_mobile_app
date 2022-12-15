import 'package:get/get.dart';
import '../../../base/base_binding.dart';

import '../controllers/empty_page_controller.dart';

class EmptyPageBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<EmptyPageController>(() => EmptyPageController());
  }
}
