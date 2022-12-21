import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/notifications/notification_data.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/invoice_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
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
  final _uiRepository = Get.find<HicoUIRepository>();

  Rx<int> index = Rx(0);
  Rx<int> badge = Rx(0);

  final channel = AppDataGlobal.client?.channel('messaging',
      id: AppDataGlobal.userInfo?.conversationInfo?.getAdminChannel() ?? '');

  List<Widget> tabs = [];
  late HomeController homeController;
  late OrderListController orderListController;
  late NotificationController notificationController;
  final newsController = NewsController();
  final accountController = AccountController();
  // int? tab;

  MainController() {
    homeController = HomeController(channel);
    orderListController = OrderListController(channel);
    notificationController = NotificationController(mainController: this);
    tabs = [
      HomeScreen(homeController),
      OrderListScreen(orderListController),
      NotificationScreen(notificationController),
      NewsScreen(newsController),
      AccountScreen(accountController),
    ];

    // if (tab != null) {
    //   changeIndex(1);
    // }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await homeController.loadData();
    await countNotifyUnread();

    try {
      await channel?.watch();
      channel?.state?.unreadCountStream.listen((event) {
        debugPrint('[MainController] channel chat admin badge $event');
        homeController.badgeChatAdmin.value = event;
        orderListController.badgeChatAdmin.value = event;
      });
    } catch (e) {
      printError(info: e.toString());
    }

    try {
      final initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null && initialMessage.data.isNotEmpty) {
        await _onSelectNotifcation(initialMessage.data);
      }
    } catch (e) {}
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 0) {
        await homeController.loadData();
      } else if (_index == 1) {
        await orderListController.loadList();
      } else if (_index == 2) {
        await notificationController.loadData();
      } else if (_index == 3) {
        await newsController.loadNewsList();
      } else if (_index == 4) {
        await accountController.loadData();
      }
    }
    index.value = _index;

    await countNotifyUnread();
  }

  Future<void> countNotifyUnread() async {
    await _uiRepository.notificationUnRead().then((response) {
      if (response.status == CommonConstants.statusOk &&
          response.data != null) {
        badge.value = response.data!;
      }
    });
  }

  Future<void> _onSelectNotifcation(Map<String, dynamic> message) async {
    debugPrint('[FirebaseMessageConfig] ONTAP NOTIFICATION: $message');
    if (message.isEmpty) {
      return;
    }

    /// ['id']: Key json chứa ID của thông báo server trả về.
    /// Dùng để điều hướng vào màn chi tiết thông báo
    /// Mặc định đang là ['id']
    ///
    final notificationData = NotificationData.fromJson(message);

    //FCM Firebase
    final type = notificationData.displayType;
    final id = int.tryParse(notificationData.invoiceId ?? '');

    //FCM GetStream
    final sender = notificationData.sender;
    final channelId = message['channel_id'] ?? '';
    if (sender == 'stream.chat' && channelId.isNotEmpty) {
      //router chat screen
      debugPrint('[FirebaseMessageConfig] router chat screen');
      await onChat(channelId);
      return;
    }

    switch (type) {
      case NotificationData.typeSupplierReviewProfile:
        // do something else 2
        await Get.toNamed(Routes.ACCOUNT);
        break;
      case NotificationData.typeSupplierAgreeCustomer:
        // do something else 3
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierCancel:
        // do something else 4
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierNewInvoice:
        // do something else 5
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeCustomerCancel:
        // do something else 6
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeCustomerExtendPeriod:
        // do something else 7
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id, extend: true));
        break;
      case NotificationData.typeSupplierCompleted:
        // do something else 8
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id, rating: true));
        break;
      case NotificationData.typeTravelingCosts:
        // do something else 9
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeTimeReminder:
        // do something else 10
        await Get.toNamed(Routes.ACCOUNT);
        break;
      case NotificationData.typeAdminApproved:
        // do something else 11
        await Get.toNamed(Routes.MAIN);
        break;
      case NotificationData.typeSystemStart:
        // do something else 12
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSendNotifyTimeout:
        // do something else 13
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeAdminApprovedWallet:
        // do something else 14
        await Get.toNamed(Routes.WALLET);
        break;
      case NotificationData.typeMissedCall:
        // do something else 16
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierOvertime:
        // do something else 17
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSystemCancel:
        // do something else 18
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSystemSendBefore10:
        // do something else 19
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSystemSendBefore5:
        // do something else 20
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierAgreeExtend:
        // do something else 21
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierRefuseExtend:
        // do something else 22
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeSupplierRefuseCustomer:
        // do something else 23
        await Get.toNamed(Routes.ORDER_DETAIL,
            arguments: InvoiceRequest(id: id));
        break;
      case NotificationData.typeAdminTransferUser:
        // do something else 24
        await Get.toNamed(Routes.WALLET);
        break;
      default:
        break;
    }
  }

  Future<void> onChat(String channelId) async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!.channel('messaging', id: channelId);
    final ids = channelId.split('-');
    final userId = ids
        .firstWhereOrNull((id) => id != AppDataGlobal.userInfo?.id.toString());
    if (userId == null) {
      return;
    }
    await EasyLoading.show();
    await AppDataGlobal.client
        ?.queryUsers(filter: Filter.autoComplete('id', userId))
        .then((response) {
      if (response.users.isEmpty) {
        return;
      }
      Get.toNamed(Routes.CHAT, arguments: {
        CommonConstants.CHANNEL: channel,
        CommonConstants.CHAT_USER: response.users.first,
      });
    });
    await EasyLoading.dismiss();
  }
}
