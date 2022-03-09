import 'package:get/get.dart';

import '../../../../base/base_binding.dart';
import '../controller/health_assistant_controller.dart';

class HealthAssistantBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<HealthAssistantController>(
        () => HealthAssistantController(Get.find()));
  }
}
