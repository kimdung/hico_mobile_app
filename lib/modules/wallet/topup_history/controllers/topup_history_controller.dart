import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/wallet/topup_history_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../wallet/controllers/wallet_controller.dart';

class TopupHistoryController extends GetxController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final WalletController walletController;

  final ScrollController scrollController = ScrollController();
  final topupHistories = RxList<TopupHistoryModel>();

  int _offset = 0;
  bool _hasReachedMax = false;

  TopupHistoryController(this.walletController) {
    printInfo(info: 'init TopupHistoryController');
    _loadList();
  }

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // You're at the top.
          // offset = 0;
          // _loadList();
        } else {
          _loadMore();
        }
      }
    });
  }

  /* API */
  Future<void> _loadList() async {
    try {
      await EasyLoading.show();
      _offset = 0;
      _hasReachedMax = false;
      await _uiRepository
          .topupHistory(CommonConstants.limit, _offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          topupHistories.value = response.data!.rows!;
          _offset = topupHistories.length;
          _hasReachedMax = response.data!.rows!.length < CommonConstants.limit;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore() async {
    if (_hasReachedMax) {
      return;
    }
    try {
      await EasyLoading.show();
      await _uiRepository
          .topupHistory(CommonConstants.limit, _offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          topupHistories.addAll(response.data!.rows!);
          _offset = topupHistories.length;
          _hasReachedMax = response.data!.rows!.length < CommonConstants.limit;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  /* Action */
  Future onTopupDetail(TopupHistoryModel topup) async {
    await Get.toNamed(Routes.TOPUP_DETAIL, arguments: topup)?.then((value) {
      if (value is bool && value) {
        this.walletController.indexPage.value = 0;
      }
    });
  }
}
