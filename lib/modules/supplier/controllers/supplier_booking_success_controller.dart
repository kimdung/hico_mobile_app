import 'package:get/get.dart';
import 'package:hico/routes/app_pages.dart';

import '../../../base/base_controller.dart';

class SupplierBookingSuccessController extends BaseController {
  String code = '';
  SupplierBookingSuccessController() {
    code = Get.arguments;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> goHome() async {
    await Get.offAndToNamed(Routes.MAIN);
  }
}
