import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/home/controllers/home_controller.dart';
import 'package:hico/modules/order/controllers/order_controller.dart';
import 'package:hico/modules/register/controllers/register_controller.dart';

class OrderBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
