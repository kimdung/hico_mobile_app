import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/supplier_detail_controller.dart';

class SupplierDetailBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put<SupplierDetailController>(SupplierDetailController());
  }
}
