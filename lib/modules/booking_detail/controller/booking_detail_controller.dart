import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/extend_period_request.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class BookingDetailController extends BaseController {
  
  Rx<ExtendPrepareModel> result = Rx(ExtendPrepareModel());
  final _uiRepository = Get.find<HicoUIRepository>();
  final invoice = Rx(InvoiceInfoModel());


  BookingDetailController(){
    result.value = Get.arguments;
  }

 @override
  Future<void> onInit() async {
    await super.onInit();  
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.invoiceDetail(result.value.invoiceId!).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.detail != null) {
          invoice.value = response.data!.detail!;
          return;
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icUserTag
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {
              Get.back();
            },
          );
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'error_mess'.tr,
        ),
        onVaLue: (value) {
          Get.back();
        },
      );
      return;
    }
  }

    Future<void> onSubmit() async {
    try {
      await EasyLoading.show();
      final request = ExtendPeriodRequest();
      request.invoiceId = result.value.invoiceId;
      request.extendPeriodId = result.value.extendPeriod!.id!;

      await _uiRepository.extendInvoice(request).then(
        (response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icUserTag
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {},
          );
          return;
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

}
