import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/shared/constants/common.dart';

import '../../../base/base_controller.dart';
import '../../account/controllers/account_controller.dart';
import '../../account/views/account_screen.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_screen.dart';
import '../../news/controllers/news_controller.dart';
import '../../news/views/news_screen.dart';
import '../../notification/controllers/notification_controller.dart';
import '../../notification/views/notification_screen.dart';
import '../../order_list/controllers/order_list_controller.dart';
import '../../order_list/views/order_list_screen.dart';

class MainController extends BaseController {
  Rx<int> index = Rx(0);
  var tabs = <Widget>[];
  final homeController = HomeController();
  final orderListController = OrderListController();
  final notificationController = NotificationController();
  final newsController = NewsController();
  final accountController = AccountController();

  MainController() {
    tabs = [
      HomeScreen(homeController),
      OrderListScreen(orderListController),
      NotificationScreen(notificationController),
      NewsScreen(newsController),
      AccountScreen(accountController),
    ];
  }
  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 0) {
        await homeController.loadData();
      } else if (_index == 1) {
        await orderListController.loadList('', InvoiceStatus.Requested.index);
      } else if (_index == 2) {
        await notificationController.loadData();
      } else if (_index == 3) {
        await newsController.loadNewsList();
      } else if (_index == 4) {
        await accountController.loadData();
      }
    }

    index.value = _index;
  }
}
