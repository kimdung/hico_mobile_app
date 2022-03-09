import 'package:get/get.dart';

import '../../../base/base_binding.dart';
import '../controllers/statistic_controller.dart';

class StatisticBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<StatisticController>(() => StatisticController());
  }
}
