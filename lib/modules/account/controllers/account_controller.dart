import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/logout_widget.dart';

class AccountController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<UserInfoModel> info = Rx(UserInfoModel());
  final storage = Get.find<SharedPreferences>();

  AccountController() {
    loadData();
  }

  @override
  Future<void> onInit() {
    return super.onInit();
  }

  Future<void> loadData() async {
    info.value = AppDataGlobal.userInfo!;
  }

  Future<void> updateInfo() async {
    await Get.toNamed(Routes.PROFILE_UPDATE)?.then((value) => loadData());
  }

  Future<void> onLogout() async {
    await DialogUtil.showPopup(
      dialogSize: DialogSize.Popup,
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
      child: const LogoutWidget(),
      onVaLue: (_value) {
        if (_value != null && _value is int) {
          if (_value == 1) {
            _uiRepository.logout().then((response) {
              AppDataGlobal.accessToken = '';
              storage.setBool(StorageConstants.isLogin, false);
              storage.setBool(StorageConstants.isSocial, false);
              storage.setString(StorageConstants.token, '');

              Get.offAllNamed(Routes.ONBOARDING);
            });
          }
        }
      },
    );
  }

  @override
  void onClose() {}
}
