import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/supplier_controller.dart';

class SupplierBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put<SupplierController>(SupplierController(Get.find()));
  }
}
