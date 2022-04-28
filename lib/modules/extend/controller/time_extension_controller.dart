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
  final extendList = List<ExtendModel>.from(dataExtendList);
  int preIndex = 0;
  ExtendModel? model;
  int? id;
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<ExtendPeriodModel> extendPeriodList = RxList<ExtendPeriodModel>();
  Rx<int> currentIndex = Rx(0);
  ExtendPeriodRequest extendRequest = ExtendPeriodRequest();
  
  TimeExtensionController(){
    id = Get.arguments;
    loadData();
  }

  @override
  Future<void> onInit() {
    extendList.forEach((element) {
      log('${element.timeExtend} minute - ${element.money} JPY');
    });
    return super.onInit();
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

  void selectExtend(int id){
    currentIndex.value = id;
  }

  void onChooseItemExtend(int currentIndex) {
    extendList[currentIndex].isChoose = true;
    extendList[preIndex].isChoose = !extendList[currentIndex].isChoose;
    preIndex = currentIndex;
    model = extendList[currentIndex];
    log('Value: ${extendList[currentIndex].isChoose}');
    update();
  }

  void onHandleExtendButton() {
    extendRequest.invoiceId = id;
    extendRequest.extendPeriodId = currentIndex.value;
    //log('Message: ${model!.timeExtend} - ${model!.money}');
    Get.toNamed(Routes.BOOKING_DETAIL, arguments: extendRequest);
  }
}
