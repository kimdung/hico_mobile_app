import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/dialog_confirm_widget.dart';
import '../../news/controllers/news_controller.dart';
import '../../news/views/news_screen.dart';

class MainGuestController extends BaseController {
  Rx<int> index = Rx(0);
  List<Widget> tabs = [];

  final newsController = NewsController();
  // int? tab;

  MainGuestController() {
    tabs = [
      NewsScreen(newsController),
      NewsScreen(newsController),
      NewsScreen(newsController),
      NewsScreen(newsController),
      NewsScreen(newsController),
    ];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    index.value = 3;
    await newsController.loadNewsList();
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 3) {
        await newsController.loadNewsList();
      } else {
        await DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: DialogConfirmWidget(
            title: 'home.notification'.tr,
            description: 'login.required'.tr,
            acceptTxt: 'login'.tr,
          ),
          onVaLue: (_value) {
            if (_value != null && _value is bool) {
              if (_value == true) {
                Get.offAndToNamed(Routes.ONBOARDING);
              }
            }
          },
        );
      }
    }
  }
}
