import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/supplier_booking_checkout_controller.dart';

class SupplierBookingCheckoutBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put<SupplierBookingCheckoutController>(SupplierBookingCheckoutController());
  }
}
