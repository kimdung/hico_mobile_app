import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/user/changepass_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/lang/translation_service.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/styles/text_style/text_style.dart';
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

class ConfigController extends BaseController {
  Rx<LanguageCode> currentLanguage = Rx<LanguageCode>(LanguageCode.VN);
  final storage = Get.find<SharedPreferences>();
  final _uiRepository = Get.find<HicoUIRepository>();

  final changePassForm = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newsPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showPassword = false;

  MasterDataModel masterData = MasterDataModel();

  @override
  Future<void> onInit() {
    masterData = AppDataGlobal.masterData!;
    final language = storage.getString(StorageConstants.language);
    switch (language) {
      case VIETNAMESE_LANG:
        currentLanguage.value = LanguageCode.VN;
        break;
      case ENGLISH_LANG:
        currentLanguage.value = LanguageCode.EN;
        break;
      case JAPANESE_LANG:
        currentLanguage.value = LanguageCode.JA;
        break;
    }
    return super.onInit();
  }

  Future<void> selectLanguage() async {
    try {
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
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> confirmLanguage() async {
    try {
      await EasyLoading.show();
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

      await _uiRepository
          .updateLangCode(AppDataGlobal.languageCode)
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
            Get.back();
          },
        );
        return;
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> changePassword() async {
    if (changePassForm.currentState?.validate() ?? false) {
      await EasyLoading.show();
      await _uiRepository
          .changePassword(ChangePassRequest(
        oldPasswordController.text,
        newsPasswordController.text,
      ))
          .then(
        (response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icPassSuccess
                  : IconConstants.icFail,
              title: response.status != CommonConstants.statusOk
                  ? response.message
                  : '',
              titleWidget: (response.status == CommonConstants.statusOk)
                  ? Column(
                      children: [
                        Text(
                          'change_pass'.tr,
                          style: TextAppStyle().normalTextStype(),
                        ),
                        Text(
                          'success'.tr,
                          style: TextAppStyle().largeTextPink(),
                        ),
                      ],
                    )
                  : Container(),
            ),
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                AppDataGlobal.client?.removeDevice(AppDataGlobal.firebaseToken);
                _uiRepository.logout().then((response) {
                  AppDataGlobal.accessToken = '';
                  storage.setBool(StorageConstants.isLogin, false);
                  storage.setBool(StorageConstants.isSocial, false);
                  storage.setString(StorageConstants.token, '');
                  Get.offAllNamed(Routes.ONBOARDING);
                });
              }
            },
          );
          return;
        },
      );
    }
  }

  Future<void> makeAction(String scheme, String endpoint) async {
    final launchUri = Uri(
      scheme: scheme,
      path: endpoint,
    );
    await launchUrl(launchUri);
  }

  @override
  void onClose() {}
}
