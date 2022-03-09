import 'package:get/get.dart';
import 'package:hico/base/base_binding.dart';
import 'package:hico/modules/news_detail/controllers/news_detail_controller.dart';

class NewsDetailBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<NewsDetailController>(() => NewsDetailController());
  }
}
