import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../resource/lang/translation_service.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

enum LanguageCode { VN, EN, JA }

extension LanguageValue on LanguageCode {
  Locale get languageLocale {
    switch (this) {
      case LanguageCode.VN:
        return const Locale('vi', 'VN');
      case LanguageCode.EN:
        return const Locale('en', 'US');
      case LanguageCode.JA:
        return const Locale('ja', 'JP');
      default:
        return const Locale('vi', 'VN');
    }
  }
}

class LanguageController extends GetxController {
  Rx<LanguageCode> currentLanguage = Rx<LanguageCode>(LanguageCode.VN);
  final storage = Get.find<SharedPreferences>();
  final HicoUIRepository _uiRepository = Get.find<HicoUIRepository>();

  @override
  Future<void> onReady() async {
    super.onReady();
    await DialogUtil.showPopup(
      dialogSize: DialogSize.Popup,
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
      child: NormalWidget(
        icon: ImageConstants.appLogo,
        title: 'notif'.tr,
      ),
      onVaLue: (value) {},
    );
  }

  Future<void> selectLanguage() async {
    switch (currentLanguage.value) {
      case LanguageCode.VN:
        AppDataGlobal.languageCode = VIETNAMESE_LANG;
        break;
      case LanguageCode.EN:
        AppDataGlobal.languageCode = ENGLISH_LANG;
        break;
      case LanguageCode.JA:
        AppDataGlobal.languageCode = JAPANESE_LANG;
        break;
    }

    TranslationService.changeLocale(currentLanguage.value.languageLocale);

    await storage.setString(
        StorageConstants.language, AppDataGlobal.languageCode);

    await _uiRepository.masterData().then((response) {
      if (response.status == CommonConstants.statusOk &&
          response.masterDataModel != null) {
        AppDataGlobal.masterData = response.masterDataModel!;
        return;
      }
    });
  }

  Future<void> confirmLanguage() async {
    switch (currentLanguage.value) {
      case LanguageCode.VN:
        AppDataGlobal.languageCode = VIETNAMESE_LANG;
        break;
      case LanguageCode.EN:
        AppDataGlobal.languageCode = ENGLISH_LANG;
        break;
      case LanguageCode.JA:
        AppDataGlobal.languageCode = JAPANESE_LANG;
        break;
    }

    TranslationService.changeLocale(currentLanguage.value.languageLocale);

    await storage.setString(
        StorageConstants.language, AppDataGlobal.languageCode);

    await Get.offAndToNamed(Routes.ONBOARDING);
  }
}
