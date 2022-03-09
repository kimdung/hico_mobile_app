import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/supplier_booking_controller.dart';

class SupplierBookingBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put<SupplierBookingController>(SupplierBookingController());
  }
}
