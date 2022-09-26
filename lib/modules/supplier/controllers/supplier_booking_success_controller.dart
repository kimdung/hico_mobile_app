import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class SupplierBookingSuccessController extends BaseController {
  String code = '';
  final _uiRepository = Get.find<HicoUIRepository>();

  SupplierBookingSuccessController() {
    code = Get.arguments;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> goHome() async {
    await _uiRepository.getInfo().then((response) {
      EasyLoading.dismiss();
      if (response.status == CommonConstants.statusOk &&
          response.data != null &&
          response.data!.info != null) {
        AppDataGlobal.userInfo = response.data!.info!;
        return;
      }
    });
    await Get.offAllNamed(Routes.MAIN, arguments: 1);
  }
}
