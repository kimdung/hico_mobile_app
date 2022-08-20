import 'package:get/get.dart';
import '../controllers/my_voucher_controller.dart';

class MyVoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyVoucherController>(() => MyVoucherController());
  }
}
