import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../resource/config/config_environment.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';

class TopupKomojuController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final _evnConfig = Get.find<EnvConfiguration>();

  late String payUrl;

  final Completer<WebViewController> webViewController =
      Completer<WebViewController>();
  bool isOrder = false;

  TopupKomojuController() {
    final arguments = Get.arguments as Map;
    isOrder = arguments[CommonConstants.TOPUP_ISORDER];
    payUrl = arguments[CommonConstants.TOPUP_DATA];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Function */
  NavigationDecision navigationDelegate(NavigationRequest request) {
    final domain =
        _evnConfig.value[UIAPIDomain] ?? 'https://hico.dev.bluebolt.software/';
    if (request.url.startsWith(domain)) {
      reponsePayment(request.url);
      return NavigationDecision.prevent;
    }
    printInfo(info: 'allowing navigation to $request');
    return NavigationDecision.navigate;
  }

  /* API */

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
      await _uiRepository.topupKomojuResult(sessionId).then((response) async {
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.row != null) {
          await _uiRepository.getInfo().then((response) {
            if (response.status == CommonConstants.statusOk &&
                response.data != null &&
                response.data!.info != null) {
              AppDataGlobal.userInfo = response.data!.info!;
            }
          });
          await EasyLoading.dismiss();
          if (isOrder) {
            Get.back(result: isOrder);
          } else {
            await Get.offAndToNamed(Routes.TOPUP_DETAIL,
                arguments: response.data!.row);
          }
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.showPopup(
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
