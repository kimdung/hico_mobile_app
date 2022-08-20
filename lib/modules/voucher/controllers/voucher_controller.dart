import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/voucher/check_voucher_data.dart';
import 'package:ui_api/models/voucher/voucher_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class VoucherController extends BaseController {
  // ignore: type_annotate_public_apis
  var scrollController = ScrollController();
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<VoucherModel> voucherList = RxList<VoucherModel>();
  CheckVoucherModel voucher = CheckVoucherModel();
  int limit = CommonConstants.limit;
  int offset = 0;
  Rx<int> voucherId = Rx<int>(0);
  double total = 0;
  Rx<bool> enableButton = Rx<bool>(false);

  final TextEditingController code = TextEditingController();


  VoucherController() {
    total = Get.arguments;
    loadData();
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
  Future<void> onInit() async {
    await super.onInit();
  }

  void selected(int id) {
    voucherId.value = id == voucherId.value ? 0: id;
    print(id);
  }

  Future<void> loadData() async {
    try {
      await EasyLoading.show();
      offset = 0;
      await _uiRepository.voucherList(limit, offset).then((response) {
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          EasyLoading.dismiss();
          if (response.data!.rows!.isNotEmpty) {
            offset = response.data!.rows!.length;
            voucherList.value = response.data!.rows!;
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
      await _uiRepository.voucherList(limit, offset).then((response) {
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          EasyLoading.dismiss();
          if (response.data!.rows!.isNotEmpty) {
            offset += response.data!.rows!.length;
            voucherList.addAll(response.data!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> approve() async {
    try {
      await EasyLoading.show();
      await _uiRepository.voucherCheck(voucherId.value, total).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          voucher.voucherId = voucherId.value;
          voucher.discount = response.data!.discount!;
          Get.back(result: voucher);
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icUserTag
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {},
          );
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> addVoucher() async {
    try {
      if(code.text.isNotEmpty){
        await EasyLoading.show();
        await _uiRepository.voucherAdd(code.text).then((response) {
          EasyLoading.dismiss();
          if (response.status == CommonConstants.statusOk &&
              response.data != null &&
              response.data!.rows != null) {
              EasyLoading.dismiss();
              if (response.data!.rows!.isNotEmpty) {
                offset = response.data!.rows!.length;
                voucherList.value = response.data!.rows!;
              }
          }else{
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: response.status == CommonConstants.statusOk
                    ? IconConstants.icUserTag
                    : IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {},
            );
            return;
          }
        });
      }
      
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void changeText(String value){
    enableButton.value = value.isNotEmpty ? true: false;
  }
  @override
  void onClose() {}
}
