import 'package:get/get.dart';

import '../controller/time_extension_controller.dart';

class TimeExtensionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeExtensionController());
  }
}
