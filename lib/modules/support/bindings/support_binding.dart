import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/support_controller.dart';

class SupportBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SupportController>(() => SupportController());
  }
}
