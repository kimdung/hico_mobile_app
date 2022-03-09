import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
