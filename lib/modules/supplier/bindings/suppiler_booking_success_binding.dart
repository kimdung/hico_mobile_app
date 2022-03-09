import 'package:get/get.dart';

import '../../../base/base_binding.dart';
import '../controllers/supplier_booking_success_controller.dart';

class SupplierBookingSuccessBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put<SupplierBookingSuccessController>(
        SupplierBookingSuccessController());
  }
}
