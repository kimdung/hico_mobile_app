import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/notifications/notification_data.dart';
import 'package:ui_api/models/notifications/notification_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/invoice_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../main/controllers/main_controller.dart';

class NotificationController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final MainController mainController;

  final scrollController = ScrollController();
  RxList<NotificationModel> notificationList = RxList<NotificationModel>();
  int limit = CommonConstants.limit;
  int offset = 0;

  NotificationController(this.mainController) {
    //loadData();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          _loadMore();
        }
      }
    });
  }

  @override
  Future<void> onInit() {
    return super.onInit();
  }

  Future<void> loadData() async {
    try {
      await EasyLoading.show();
      await mainController.countNotifyUnread();
      offset = 0;
      await _uiRepository.notificationList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset = response.data!.rows!.length;
            notificationList.value = response.data!.rows!;
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore() async {
    try {
      await EasyLoading.show();
      await _uiRepository.notificationList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset += response.data!.rows!.length;
            notificationList.addAll(response.data!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> reloadBalance() async {
    await _uiRepository.getInfo().then((response) {
      if (response.status == CommonConstants.statusOk &&
          response.data != null &&
          response.data!.info != null) {
        AppDataGlobal.userInfo = response.data!.info!;
      }
    });
  }

  Future<void> viewDetail(
      int id, int displayType, int? invoiceId, String? typeLink) async {
    await reloadBalance();
    //Router
    await _uiRepository.notificationDetail(id).then((response) {
      EasyLoading.dismiss();
      switch (displayType.toString()) {
        case NotificationData.typeSupplierReviewProfile:
          // do something else 2
          Get.toNamed(Routes.ACCOUNT)?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierAgreeCustomer:
          // do something else 3
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierCancel:
          // do something else 4
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierNewInvoice:
          // do something else 5
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeCustomerCancel:
          // do something else 6
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeCustomerExtendPeriod:
          // do something else 7
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId, extend: true))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierCompleted:
          // do something else 8
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId, rating: true))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeTravelingCosts:
          // do something else 9
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeTimeReminder:
          // do something else 10
          Get.toNamed(Routes.ACCOUNT)?.then((value) {
            loadData();
          });
          break;
        case NotificationData.typeAdminApproved:
          // do something else 11
          Get.toNamed(Routes.MAIN);
          break;
        case NotificationData.typeSystemStart:
          // do something else 12
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSendNotifyTimeout:
          // do something else 13
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeAdminApprovedWallet:
          // do something else 14
          Get.toNamed(Routes.WALLET);
          break;
        case NotificationData.typeMissedCall:
          // do something else 16
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierOvertime:
          // do something else 17
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSystemCancel:
          // do something else 18
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSystemSendBefore10:
          // do something else 19
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSystemSendBefore5:
          // do something else 20
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierAgreeExtend:
          // do something else 21
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierRefuseExtend:
          // do something else 22
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeSupplierRefuseCustomer:
          // do something else 23
          Get.toNamed(Routes.ORDER_DETAIL,
                  arguments: InvoiceRequest(id: invoiceId))
              ?.then((value) => loadData());
          break;
        case NotificationData.typeAdminTransferUser:
          // do something else 24
          Get.toNamed(Routes.STATISTIC);
          break;
        case NotificationData.typeUrlLink:
          // do something else 26
          final _url = Uri.parse(typeLink ?? '');
          launchUrl(_url);
          break;
        case NotificationData.typeNews:
          // do something else 27
          if (typeLink != null && typeLink.isNotEmpty) {
            Get.toNamed(Routes.NEWS_DETAIL, arguments: int.parse(typeLink));
          }
          break;
        default:
          Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: id)
              ?.then((value) => loadData());
          break;
      }
    });
  }

  @override
  void onClose() {}
}
