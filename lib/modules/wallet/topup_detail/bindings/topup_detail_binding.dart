import 'package:get/get.dart';

import '../controllers/topup_detail_controller.dart';

class TopupDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupDetailController>(
      () => TopupDetailController(Get.arguments),
    );
  }
}
