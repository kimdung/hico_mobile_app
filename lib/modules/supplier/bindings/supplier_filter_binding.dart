import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/supplier_filter_controller.dart';

class SupplierFilterBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SupplierFilterController>(() => SupplierFilterController());
  }
}
