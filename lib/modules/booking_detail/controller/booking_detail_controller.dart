import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/extend_period_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widget_hico/dialog/topup_widget.dart';

class BookingDetailController extends BaseController {
  Rx<ExtendPrepareModel> result = Rx(ExtendPrepareModel());
  final _uiRepository = Get.find<HicoUIRepository>();
  final invoice = Rx(InvoiceInfoModel());
  var userInfo = Rx(AppDataGlobal.userInfo);

  BookingDetailController() {
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
      await _uiRepository
          .invoiceDetail(result.value.invoiceId!)
          .then((response) {
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

      if (AppDataGlobal.userInfo!.accountBalance! <
          result.value.extendPeriod!.price!) {
        await EasyLoading.dismiss();
        await DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: TopupWidget(
            icon: IconConstants.icFail,
            title: 'booking.wallet_not_enough'.tr,
          ),
          onVaLue: (_value) {
            if (_value != null && _value is int) {
              if (_value == 1) {
                Get.toNamed(Routes.WALLET)!
                    .then((value) => userInfo.value = AppDataGlobal.userInfo);
              }
            }
          },
        );
        return;
      }
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
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                _uiRepository.getInfo().then((response) {
                  if (response.status == CommonConstants.statusOk &&
                      response.data != null &&
                      response.data!.info != null) {
                    AppDataGlobal.userInfo = response.data!.info!;
                  }
                });
                Get.offAllNamed(Routes.MAIN);
              }
            },
          );
          return;
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
