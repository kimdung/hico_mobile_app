import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/invoice/invoice_list_model.dart';
import 'package:ui_api/models/invoice/invoice_status.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class OrderListController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final Channel adminChatChannel;

  Rx<UserInfoModel> info = Rx(UserInfoModel());

  final Rx<int> totalNotif = Rx(0);

  String keyword = '';

  final Rx<InvoiceStatus> currentStatus = Rx(InvoiceStatus.requested);
  final List<InvoiceStatus> invoiceStatus = InvoiceStatus.status;

  final RxList<InvoiceHistoryModel> list = RxList<InvoiceHistoryModel>();

  final ScrollController scrollController = ScrollController();
  int limit = 4;
  int offset = 0;

  OrderListController(this.adminChatChannel);

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
          _loadMore();
        }
      }
    });
  }

  Future<void> selectStatus(InvoiceStatus status) async {
    currentStatus.value = status;
    await loadList();
  }

  Future<void> onSearch(String text) async {
    keyword = text;
    await loadList();
  }

  Future<void> loadList() async {
    try {
      await EasyLoading.show();
      info.value = AppDataGlobal.userInfo!;
      offset = 0;
      await _uiRepository
          .invoiceHistory(keyword, currentStatus.value.id, limit, offset)
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

  Future<void> _loadMore() async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .invoiceHistory(keyword, currentStatus.value.id, limit, offset)
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
      filter: Filter.autoComplete('id', invoice.supplierId.toString()),
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
