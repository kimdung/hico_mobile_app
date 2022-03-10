import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class ForgotPasswordController extends BaseController {
  final forgetGlobalKey = GlobalKey<FormState>();
  final forgetOtpGlobalKey = GlobalKey<FormState>();
  final forgetChangeGlobalKey = GlobalKey<FormState>();
  final _uiRepository = Get.find<HicoUIRepository>();

  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController optController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showPassword = false;
  Rx<String> emailHidden = Rx('');
  String code = '';
  @override
  Future<void> onInit() {
    idController.text = 'forgot_password';
    usernameController.text = '';
    return super.onInit();
  }

  @override
  void onClose() {}

  Future<void> onForgot() async {
    try {
      if (forgetGlobalKey.currentState?.validate() ?? false) {
        await EasyLoading.show();
        emailHidden.value = usernameController.text
            .replaceAll(RegExp('(?<=.)[^@](?=[^@]*?[^@]@)'), '*');

        await _uiRepository
            .forgetPassword(usernameController.text)
            .then((response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icSuccessOrder
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                Get.toNamed(Routes.FORGOT_PASSWORD_OTP);
              }
            },
          );
          return;
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> resendOtp() async {
    try {
      await _uiRepository
          .forgetPassword(usernameController.text)
          .then((response) {
        EasyLoading.dismiss();
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: response.status == CommonConstants.statusOk
                ? IconConstants.icSuccessOrder
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

  Future<void> onConfirm(String v) async {
    code = v;
    await Get.toNamed(Routes.FORGOT_PASSWORD_CHANGE);
  }

  Future<void> onChange() async {
    try {
      if (forgetChangeGlobalKey.currentState?.validate() ?? false) {
        await EasyLoading.show();
        emailHidden.value = usernameController.text
            .replaceAll(RegExp('(?<=.)[^@](?=[^@]*?[^@]@)'), '*');

        await _uiRepository
            .resetPassword(
                code, usernameController.text, passwordController.text)
            .then((response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icSuccessOrder
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                Get.offAndToNamed(Routes.LOGIN);
              }
            },
          );
          return;
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
