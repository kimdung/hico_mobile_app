import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/rating_request.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widget_hico/dialog/rating_widget.dart';
import '../../../shared/widget_hico/dialog/text_field_widget.dart';
import '../../../shared/widget_hico/invoice/cancel_invoice_widget.dart';

enum OrderInfoViewType { Text, Button, Status }

class OrderController extends BaseController {
  final Rx<int> showExtend = Rx(0);
  final _uiRepository = Get.find<HicoUIRepository>();
  final invoice = Rx(InvoiceInfoModel());
  int id = 0;

  @override
  Future<void> onInit() async {
    await super.onInit();

    id = Get.arguments;
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.invoiceDetail(id).then((response) {
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

  Future<void> changeSupplierRequest() async {
    try {
      await EasyLoading.show();
      await _uiRepository.changeSupplierRequest(id).then(
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

  Future<void> editRequest() async {
    try {
      await EasyLoading.show();
      await _uiRepository.editInvoiceRequest(id).then((response) {
        EasyLoading.dismiss();
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: response.status == CommonConstants.statusOk
                ? IconConstants.edit
                : IconConstants.icFail,
            title: response.message,
          ),
          onVaLue: (value) {},
        );
        return;
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onExtend() async {}
  Future<void> onRating() async {
    try {
      await DialogUtil.showPopup(
        barrierDismissible: true,
        height: 397,
        backgroundColor: AppColor.primaryBackgroundColorLight,
        onPress: () {},
        child: RatingDialogWidget(
          id: id,
          height: 397,
          icon: invoice.value.supplierAvatar,
          padding: 18,
          hintText: 'invoice.detail.hint_rating'.tr,
        ),
        onVaLue: (_value) {
          if (_value != null && _value is RatingRequest) {
            // call api rating
            EasyLoading.show();
            _uiRepository.editInvoiceRequest(id).then((response) {
              EasyLoading.dismiss();
              DialogUtil.showPopup(
                dialogSize: DialogSize.Popup,
                barrierDismissible: false,
                backgroundColor: Colors.transparent,
                child: NormalWidget(
                  icon: response.status == CommonConstants.statusOk
                      ? IconConstants.edit
                      : IconConstants.icFail,
                  title: response.message,
                ),
                onVaLue: (value) {},
              );
              return;
            });
          }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> cancel() async {
    try {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        height: invoice.value.isFined == 0 ? 292 : 270,
        backgroundColor: AppColor.primaryBackgroundColorLight,
        onPress: () {},
        child: TextDialogWidget(
          height: invoice.value.isFined == 0 ? 292 : 270,
          icon: invoice.value.isFined == 0
              ? IconConstants.icFund
              : IconConstants.icFail,
          padding: invoice.value.isFined == 0 ? 10 : 32,
          hintText: 'invoice.detail.hint_cancel'.tr,
          titleWidget: CancelInvoiceWidget(
            total: invoice.value.total,
            isFined: invoice.value.isFined,
          ),
        ),
        onVaLue: (_value) {
          if (_value != null && _value is String) {
            // call api cancel
            EasyLoading.show();
            _uiRepository.invoiceCancel(id, _value).then((response) {
              EasyLoading.dismiss();
              if (response.status != CommonConstants.statusOk) {
                DialogUtil.showPopup(
                  dialogSize: DialogSize.Popup,
                  barrierDismissible: false,
                  backgroundColor: Colors.transparent,
                  child: NormalWidget(
                    icon: IconConstants.icFail,
                    title: response.message,
                  ),
                  onVaLue: (value) {},
                );
              }
              return;
            });
          }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {}
}
