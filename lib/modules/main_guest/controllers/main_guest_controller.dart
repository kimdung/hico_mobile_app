import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../empty_page/views/empty_page_screen.dart';
import '../../home_guest/controllers/home_guest_controller.dart';
import '../../home_guest/views/home_guest_screen.dart';
import '../../news/controllers/news_controller.dart';
import '../../news/views/news_screen.dart';

class MainGuestController extends BaseController {
  Rx<int> index = Rx(0);
  List<Widget> tabs = [];

  late HomeGuestController homeController;
  final newsController = NewsController();
  // int? tab;

  MainGuestController() {
    homeController = HomeGuestController();
    tabs = [
      HomeGuestScreen(homeController),
      EmptyPageScreen(),
      EmptyPageScreen(),
      NewsScreen(newsController),
      EmptyPageScreen(),
    ];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    // index.value = 3;
    // await newsController.loadNewsList();

    await homeController.loadData();
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 3) {
        await newsController.loadNewsList();
        index.value = _index;
      } else if (_index == 0) {
        await homeController.loadData();
        index.value = _index;
      } else {
        index.value = _index;

        // await DialogUtil.showPopup(
        //   dialogSize: DialogSize.Popup,
        //   barrierDismissible: false,
        //   backgroundColor: Colors.transparent,
        //   child: DialogConfirmWidget(
        //     title: 'home.notification'.tr,
        //     description: 'login.required'.tr,
        //     acceptTxt: 'login'.tr,
        //   ),
        //   onVaLue: (_value) {
        //     if (_value != null && _value is bool) {
        //       if (_value == true) {
        //         Get.offAndToNamed(Routes.ONBOARDING);
        //       }
        //     }
        //   },
        // );
      }
    }
  }
}
