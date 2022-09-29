import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/extend_period_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/extend_period_request.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../extend_model.dart';

class TimeExtensionController extends BaseController {
  ExtendModel? model;
  int? id;
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<ExtendPeriodModel> extendPeriodList = RxList<ExtendPeriodModel>();
  Rx<ExtendPeriodModel> currentIndex = Rx(ExtendPeriodModel());
  ExtendPrepareModel extendRPrepare = ExtendPrepareModel();

  TimeExtensionController() {
    id = Get.arguments;
    loadData();
  }

  Future<void> loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.extendPeriod().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk) {
          extendPeriodList.value = response.data!;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectExtend(ExtendPeriodModel id) async {
    currentIndex.value = id;
    currentIndex.refresh();
  }

  void onHandleExtendButton() {
    extendRPrepare.invoiceId = id;
    extendRPrepare.extendPeriod = currentIndex.value;
    if (currentIndex.value.id == null) {
      DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: IconConstants.icFail,
            title: 'extend.error'.tr,
          ),
          onVaLue: (value) {
            
          },
        );

    } else {
      Get.toNamed(Routes.BOOKING_DETAIL, arguments: extendRPrepare);
    }
  }
}
