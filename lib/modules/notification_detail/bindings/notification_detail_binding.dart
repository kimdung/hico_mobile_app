import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/account/controllers/account_controller.dart';
import 'package:hico/modules/notification_detail/controllers/notification_detail_controller.dart';

class NotificationDetailBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<NotificationDetailController>(
        () => NotificationDetailController());
  }
}
