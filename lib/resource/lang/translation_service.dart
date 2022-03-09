import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translations/ja_JP.dart';
import 'translations/en_US.dart';
import 'translations/vi_VN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('vi', 'VN');

  static final langCodes = [
    'en',
    'vi',
    'ja',
  ];
  static void changeLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
        'ja_JP': ja_JP,
      };
}
