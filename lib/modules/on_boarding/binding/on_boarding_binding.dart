import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/on_boarding/controller/on_boarding_controller.dart';
import '/modules/language/controller/language_controller.dart';

class OnBoardingBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
