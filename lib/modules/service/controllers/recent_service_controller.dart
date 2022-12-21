import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class RecentServiceController extends BaseController {
  final Rx<int> totalRecord = Rx(0);
  int limit = 20;
  int offset = 0;
  final _uiRepository = Get.find<HicoUIRepository>();
  final serviceList = RxList<ServiceModel>();
  BookingPrepareRequest request = BookingPrepareRequest();

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData('');
  }

  Future<void> _loadData(String keyword) async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .serviceRecent(limit, offset, keyword)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.dataService != null &&
            response.dataService!.services != null) {
          serviceList.value = response.dataService!.services!;
          totalRecord.value = response.dataService!.recordsTotal!;
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

  Future<void> viewService(ServiceModel item) async {
    request.service = item;
    if (AppDataGlobal.accessToken.isNotEmpty) {
      try {
        await _uiRepository.serviceView(item.id!);
      } catch (e) {
        printError(info: e.toString());
      }
    }
    await Get.toNamed(Routes.SUPPLIER_LIST, arguments: item);
  }

  @override
  void onClose() {}
}
