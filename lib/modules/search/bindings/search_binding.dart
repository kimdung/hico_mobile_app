import 'package:get/get.dart';

import '../../../base/base_binding.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
