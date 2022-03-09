import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/lang/translation_service.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';

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

  @override
  Future<void> onReady() async {
    super.onReady();
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
