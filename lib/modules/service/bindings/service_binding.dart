import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/service_controller.dart';

class ServiceBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
