import 'package:get/get.dart';
import 'package:hico/modules/consulting/controllers/consulting_controller.dart';
import '../../../base/base_binding.dart';

class ConsultingBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ConsultingController>(() => ConsultingController());
  }
}
