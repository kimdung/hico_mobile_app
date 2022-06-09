import 'package:get/get.dart';

import '../controllers/topup_komoju_controller.dart';

class TopupKomojuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupKomojuController>(
      () => TopupKomojuController(),
    );
  }
}
