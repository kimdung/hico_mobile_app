import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class ServiceCategoriesController extends BaseController {
  final Rx<int> totalRecord = Rx(0);
  int limit = 20;
  int offset = 0;
  final _uiRepository = Get.find<HicoUIRepository>();
  final serviceCategories = RxList<ServiceCategoryModel>();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData('');
  }

  Future<void> _loadData(String keyword) async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .serviceCategories(limit, offset, keyword)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.dataServiceCategories != null &&
            response.dataServiceCategories!.serviceCategories != null) {
          serviceCategories.value =
              response.dataServiceCategories!.serviceCategories!;
          totalRecord.value = response.dataServiceCategories!.recordsTotal!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> search(String text) async {
    await _loadData(text);
  }

  Future<void> viewDetail(int id) async {
    await Get.toNamed(Routes.SERVICE, arguments: id);
  }

  @override
  void onClose() {}
}
