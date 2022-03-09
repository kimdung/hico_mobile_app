import 'package:get/get.dart';

import '../../../base/base_binding.dart';
import '../controllers/news_list_controller.dart';

class NewsListBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<NewsListController>(() => NewsListController());
  }
}
