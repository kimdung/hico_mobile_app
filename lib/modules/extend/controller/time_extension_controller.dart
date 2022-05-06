import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/extend_period_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/extend_period_request.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../extend_model.dart';

class TimeExtensionController extends BaseController {
  ExtendModel? model;
  int? id;
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<ExtendPeriodModel> extendPeriodList = RxList<ExtendPeriodModel>();
  Rx<ExtendPeriodModel> currentIndex = Rx(ExtendPeriodModel());
  ExtendPrepareModel extendRPrepare = ExtendPrepareModel();
  
  TimeExtensionController(){
    id = Get.arguments;
    loadData();
  }


Future<void> loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.extendPeriod().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk)
        {
          extendPeriodList.value = response.data!;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectExtend(ExtendPeriodModel id) async {
    currentIndex.value = id;
  }
  
  void onHandleExtendButton() {
    extendRPrepare.invoiceId = id;
    extendRPrepare.extendPeriod = currentIndex.value;
    //log('Message: ${model!.timeExtend} - ${model!.money}');
    Get.toNamed(Routes.BOOKING_DETAIL, arguments: extendRPrepare);
  }
}
