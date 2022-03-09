import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/new_service_controller.dart';

class NewServiceBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<NewServiceController>(() => NewServiceController());
  }
}
