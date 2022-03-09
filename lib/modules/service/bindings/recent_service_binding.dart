import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/recent_service_controller.dart';

class RecentServiceBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<RecentServiceController>(() => RecentServiceController());
  }
}
