import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/data/app_data_global.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/invoice/invoice_list_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class OrderListController extends BaseController {
  final Rx<int> currentStatus = Rx(0);
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<UserInfoModel> info = Rx(UserInfoModel());
  var scrollController = ScrollController();
  int limit = 4;
  int offset = 0;
  String keyword = '';
  int statusId = InvoiceStatus.Requested.index;

  RxList<InvoiceHistoryModel> list = RxList<InvoiceHistoryModel>();

  final List<InvoiceStatus> invoiceStatus = [
    InvoiceStatus.Requested,
    InvoiceStatus.Accepted,
    InvoiceStatus.Successed,
    InvoiceStatus.Canceled
  ];

  OrderListController() {
    loadList(keyword, statusId);
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // You're at the top.
          // offset = 0;
          // _loadNewsList();
        } else {
          _loadMore(keyword, statusId);
        }
      }
    });
  }

  Future<void> selectStatus(int status) async {
    currentStatus.value = status;
    statusId = status + 1;
    print(status);
    await EasyLoading.show();
    await loadList(keyword, statusId);
    await EasyLoading.dismiss();
  }

  Future<void> search(String text) async {
    keyword = text;
    await EasyLoading.show();
    await loadList(keyword, statusId);
    await EasyLoading.dismiss();
  }

  Future<void> loadList(String keyword, int status) async {
    try {
      await EasyLoading.show();
      info.value = AppDataGlobal.userInfo!;
      offset = 0;
      await _uiRepository
          .invoiceHistory(keyword, status, limit, offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          offset = response.data!.rows!.length;
          list.value = response.data!.rows!;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore(String keyword, int status) async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .invoiceHistory(keyword, status, limit, offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset += response.data!.rows!.length;
            list.addAll(response.data!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> viewDetail(int id) async {
    await Get.toNamed(Routes.ORDER_DETAIL, arguments: id);
  }

  Future<void> onChatAdmin() async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!.channel('messaging',
        id: AppDataGlobal.userInfo?.conversationInfo?.getAdminChannel() ?? '');

    final _usersResponse = await AppDataGlobal.client?.queryUsers(
      filter: Filter.autoComplete(
          'id', AppDataGlobal.userInfo?.conversationInfo?.adminId ?? ''),
    );

    await Get.toNamed(Routes.CHAT, arguments: {
      CommonConstants.CHANNEL: channel,
      CommonConstants.CHAT_USER: (_usersResponse?.users.isEmpty ?? true)
          ? AppDataGlobal.userInfo?.conversationInfo?.getAdmin()
          : _usersResponse!.users.first,
    });
  }

  Future<void> onChat(InvoiceHistoryModel invoice) async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!
        .channel('messaging', id: invoice.getChatChannel());
    final _usersResponse = await AppDataGlobal.client?.queryUsers(
      filter: Filter.autoComplete('id', invoice.serviceId.toString()),
    );

    await Get.toNamed(Routes.CHAT, arguments: {
      CommonConstants.CHANNEL: channel,
      CommonConstants.CHAT_USER: (_usersResponse?.users.isEmpty ?? true)
          ? invoice.getProvider()
          : _usersResponse!.users.first,
    });
  }

  Future<void> onCall(InvoiceHistoryModel invoice) async {}

  Future<void> onVideo(InvoiceHistoryModel invoice) async {}
}
