import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/config/controllers/config_controller.dart';

class ConfigBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ConfigController>(() => ConfigController());
  }
}
