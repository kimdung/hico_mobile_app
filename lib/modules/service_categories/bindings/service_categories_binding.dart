import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../../service/controllers/service_controller.dart';
import '../controllers/service_categories_controller.dart';

class ServiceCategoriesBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ServiceCategoriesController>(
        () => ServiceCategoriesController());
  }
}
