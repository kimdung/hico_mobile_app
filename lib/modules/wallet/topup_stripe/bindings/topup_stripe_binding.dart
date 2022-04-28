import 'package:get/get.dart';

import '../controllers/topup_stripe_controller.dart';

class TopupStripeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupStripeController>(
      () => TopupStripeController(),
    );
  }
}
