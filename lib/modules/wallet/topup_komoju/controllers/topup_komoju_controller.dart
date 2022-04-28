import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../base/base_controller.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';

class TopupKomojuController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final String payUrl;

  final Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  TopupKomojuController(this.payUrl);

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> reponsePayment(String url) async {
    final sessionId = Uri.parse(url).queryParameters['session_id'];
    if (sessionId == null) {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'topup.error'.tr,
        ),
        onVaLue: (value) {
          Get.back();
        },
      );
      return;
    }
    try {
      await EasyLoading.show();
      await _uiRepository.topupKomojuResult(sessionId).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.row != null) {
          Get.offAndToNamed(Routes.TOPUP_DETAIL, arguments: response.data!.row);
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: response.message ?? 'topup.failure'.tr,
            ),
            onVaLue: (value) {
              Get.back();
            },
          );
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
