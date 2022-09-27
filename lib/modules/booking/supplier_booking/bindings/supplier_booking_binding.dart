import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/supplier_booking_controller.dart';

class BookingSupplierBookingBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<BookingSupplierBookingController>(
        () => BookingSupplierBookingController());
  }
}
