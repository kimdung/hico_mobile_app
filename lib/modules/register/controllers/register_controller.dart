import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/data/app_data_global.dart';
import 'package:hico/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/register/register_otp_request.dart';
import 'package:ui_api/request/register/register_request.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class RegisterController extends BaseController {
  final registerForm = GlobalKey<FormState>();
  final registerOtpForm = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<String> emailHidden = Rx('');
  bool showPassword = false;

  final storage = Get.find<SharedPreferences>();

  RegisterController() {
    usernameController.text = Get.arguments ?? '';
    emailHidden.value = Get.arguments != null
        ? usernameController.text
            .replaceAll(RegExp('(?<=.)[^@](?=[^@]*?[^@]@)'), '*')
        : '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  @override
  Future<void> onInit() {
    return super.onInit();
  }

  @override
  void onClose() {}

  Future<void> register() async {
    try {
      if (registerForm.currentState?.validate() ?? false) {
        await EasyLoading.show();

        emailHidden.value = usernameController.text
            .replaceAll(RegExp('(?<=.)[^@](?=[^@]*?[^@]@)'), '*');

        await _uiRepository
            .register(RegisterRequest(
          usernameController.text,
          passwordController.text,
          confirmPasswordController.text,
        ))
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
                Get.toNamed(Routes.REGISTER_OTP);
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
      await _uiRepository.resendOtp(usernameController.text).then((response) {
        EasyLoading.dismiss();
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: AppColor.primaryBackgroundColorLight,
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

  Future<void> confirmOtp(String value) async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .registerOtp(RegisterOtpRequest(
        usernameController.text,
        value,
      ))
          .then((response) {
        EasyLoading.dismiss();
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: AppColor.primaryBackgroundColorLight,
          child: NormalWidget(
            icon: response.status == CommonConstants.statusOk
                ? IconConstants.icSuccessOrder
                : IconConstants.icFail,
            title: response.message,
          ),
          onVaLue: (value) {
            if (response.status == CommonConstants.statusOk) {
              storage.setString(
                  StorageConstants.username, usernameController.text);
              storage.setString(
                  StorageConstants.password, passwordController.text);
              storage.setBool(StorageConstants.isLogin, true);

              AppDataGlobal.accessToken = response.loginModel!.accessToken!;
              AppDataGlobal.userInfo = response.loginModel!.info!;
              AppDataGlobal.isLogin = true;

              Get.toNamed(Routes.REGISTER_SUCCESS);
            }
          },
        );
        return;
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> registerSuccess() async {
    await Get.offAllNamed(Routes.MAIN);
  }

  Future<void> onLogin() async {
    await Get.offAllNamed(Routes.MAIN);
  }

  Future<void> privatePolicy() async {
    await Get.toNamed(Routes.POLICY);
  }

  Future<void> termsOfUse() async {
    await Get.toNamed(Routes.TERMS_OF_USE);
  }
}
