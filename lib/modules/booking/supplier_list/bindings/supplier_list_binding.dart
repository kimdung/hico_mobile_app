import 'package:get/get.dart';

import '../../../../base/base_binding.dart';
import '../controllers/supplier_list_controller.dart';

class SupplierListBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SupplierListController>(() => SupplierListController());
  }
}
