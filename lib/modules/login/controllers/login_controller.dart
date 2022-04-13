import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/user/login_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/login/login_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/services/login_social_services.dart';
import '../../../shared/utils/chat_util.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class LoginController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final formLogin = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _loginSocialServices = LoginSocialServices();

  UserProfile? _userProfile;
  StoredAccessToken? accessToken;

  bool showPassword = false;

  final storage = Get.find<SharedPreferences>();

  @override
  Future<void> onInit() {
    usernameController.text = '';
    passwordController.text = '';

    usernameController.text = 'Cuong.nguyen@blueboltsoftware.com';
    passwordController.text = '123456';

    final error = Get.arguments;

    if (error is String && error.isNotEmpty) {
      EasyLoading.showToast(error);
    }

    return super.onInit();
  }

  @override
  void onClose() {}

  Future<void> onLogin() async {
    if (formLogin.currentState?.validate() ?? false) {
      await EasyLoading.show();
      await login();
    }
  }

  Future<void> login() async {
    await _uiRepository
        .login(LoginRequest(
            email: usernameController.text,
            password: passwordController.text,
            deviceIdentifier: AppDataGlobal.firebaseToken))
        .then((response) {
      EasyLoading.dismiss();
      if (response.status == CommonConstants.statusOk &&
          response.loginModel != null &&
          response.loginModel!.info != null) {
        storage.setString(StorageConstants.username, usernameController.text);
        storage.setString(StorageConstants.password, passwordController.text);
        storage.setBool(StorageConstants.isLogin, true);

        _loadData(response.loginModel!);
      } else if (response.loginModel != null &&
          response.loginModel!.isResend == 1) {
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: response.status == CommonConstants.statusOk
                ? IconConstants.icPassSuccess
                : IconConstants.icFail,
            title: response.message,
            titleBtn: '${'register.resend'.tr} OTP',
          ),
          onVaLue: (value) {
            EasyLoading.show();
            _uiRepository.resendOtp(usernameController.text).then((response) {
              EasyLoading.dismiss();
              if (response.status == CommonConstants.statusOk) {
                Get.toNamed(Routes.REGISTER_OTP,
                    arguments: usernameController.text);
              } else {
                DialogUtil.showPopup(
                  dialogSize: DialogSize.Popup,
                  barrierDismissible: false,
                  backgroundColor: AppColor.primaryBackgroundColorLight,
                  child: NormalWidget(
                    icon: IconConstants.icFail,
                    title: response.message,
                  ),
                  onVaLue: (value) {},
                );
                return;
              }
            });
          },
        );
        return;
      } else {
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: response.status == CommonConstants.statusOk
                ? IconConstants.icPassSuccess
                : IconConstants.icFail,
            title: response.message,
          ),
          onVaLue: (value) {},
        );
      }
    }).catchError(
      (onError) {
        EasyLoading.dismiss();
      },
    );
  }

  Future<void> loadData() async {}

  Future<void> loginFB() async {
    try {
      final loginFaceBook = await _loginSocialServices.loginWithFacebook();
      if (loginFaceBook.accessToken?.token.isNotEmpty ?? false) {
        await _uiRepository
            .loginFB(LoginRequest(
                accessToken: loginFaceBook.accessToken?.token,
                deviceIdentifier: AppDataGlobal.firebaseToken))
            .then((response) {
          EasyLoading.dismiss();
          if (response.status == CommonConstants.statusOk &&
              response.loginModel != null &&
              response.loginModel!.info != null) {
            storage.setString(
                StorageConstants.token, response.loginModel!.accessToken!);
            storage.setBool(StorageConstants.isSocial, true);

            _loadData(response.loginModel!);
          } else {
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: response.status == CommonConstants.statusOk
                    ? IconConstants.icPassSuccess
                    : IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {},
            );
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loginGG() async {
    try {
      final loginGoogle = await _loginSocialServices.loginWithGoogle();
      if (loginGoogle.accessToken?.isNotEmpty ?? false) {
        await _uiRepository
            .loginGG(LoginRequest(
                accessToken: loginGoogle.accessToken,
                deviceIdentifier: AppDataGlobal.firebaseToken))
            .then((response) {
          EasyLoading.dismiss();
          if (response.status == CommonConstants.statusOk &&
              response.loginModel != null &&
              response.loginModel!.info != null) {
            storage.setString(
                StorageConstants.token, response.loginModel!.accessToken!);
            storage.setBool(StorageConstants.isSocial, true);

            _loadData(response.loginModel!);
          } else {
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: response.status == CommonConstants.statusOk
                    ? IconConstants.icPassSuccess
                    : IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {
                _loginSocialServices.logOutGoogle();
                _loginSocialServices.logOutFirebaseUser();
              },
            );
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loginLine() async {
    try {
      if (_userProfile == null) {
        final result = await LineSDK.instance.login();
        _userProfile = result.userProfile!;
      }
      if (_userProfile != null) {
        accessToken = await LineSDK.instance.currentAccessToken;
        //call api;
        await _uiRepository
            .loginLine(LoginRequest(
                accessToken: accessToken!.value,
                deviceIdentifier: AppDataGlobal.firebaseToken))
            .then((response) {
          EasyLoading.dismiss();
          if (response.status == CommonConstants.statusOk &&
              response.loginModel != null &&
              response.loginModel!.info != null) {
            storage.setString(
                StorageConstants.token, response.loginModel!.accessToken!);
            storage.setBool(StorageConstants.isSocial, true);

            _loadData(response.loginModel!);
          } else {
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: response.status == CommonConstants.statusOk
                    ? IconConstants.icPassSuccess
                    : IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {},
            );
          }
        });
      }
    } on PlatformException catch (e) {
      // Error handling.
      print(e);
    }
  }

  Future<void> signin() async {
    await Get.toNamed(Routes.REGISTER);
  }

  Future<void> forgorPassword() async {
    await Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  Future<void> _loadData(LoginModel loginModel) async {
    AppDataGlobal.accessToken = loginModel.accessToken ?? '';
    AppDataGlobal.userInfo = loginModel.info;
    AppDataGlobal.isLogin = true;

    if (loginModel.info?.conversationInfo?.token?.isEmpty ?? true) {
      await _uiRepository.createChatToken().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          AppDataGlobal.userInfo?.conversationInfo = response.data;
        }
      });
    }

    ChatUtil.initChat(AppDataGlobal.userInfo?.conversationInfo?.apiKey ?? '');
    await EasyLoading.dismiss();

    await Get.offAllNamed(Routes.MAIN);
  }
}
