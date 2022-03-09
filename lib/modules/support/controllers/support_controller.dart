import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/general/contact_request.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class SupportController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final supportForm = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController contents = TextEditingController();

  bool showPassword = false;

  @override
  Future<void> onInit() async {
    return super.onInit();
  }

  Future<void> send() async {
    try {
      if (supportForm.currentState?.validate() ?? false) {
        await EasyLoading.show();
        await _uiRepository
            .contact(ContactRequest(
          name.text,
          email.text,
          phone.text,
          contents.text,
        ))
            .then((response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icSuccess
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                Get.back();
              }
            },
          );
          return;
        }).catchError(
          (onError) {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: const NormalWidget(
                icon: IconConstants.icFail,
                title: 'There was an error processing, please try again!',
              ),
              onVaLue: (value) {},
            );
          },
        );
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {}
}
