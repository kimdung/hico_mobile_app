import 'package:get/get.dart';
import '../../../base/base_binding.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
