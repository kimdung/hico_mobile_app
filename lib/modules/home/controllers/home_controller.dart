import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:ui_api/request/invoice/rating_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widget_hico/dialog/rating_widget.dart';

class HomeController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final Rx<int> currentStatus = Rx(0);
  final Rx<int> badgeChatAdmin = Rx(0);
  final Rx<int> bottomIndex = Rx(0);

  final homeModel = Rx(HomeModel());

  BookingPrepareRequest request = BookingPrepareRequest();
  var userInfo = Rx(UserInfoModel());

  Channel? adminChatChannel;

  HomeController(this.adminChatChannel) {
    //loadData();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadData() async {
    try {
      userInfo.value = AppDataGlobal.userInfo!;
      await _uiRepository.home().then((response) {
        if (response.status == CommonConstants.statusOk &&
            response.homeModel != null) {
          homeModel.value = response.homeModel!;
          if (homeModel.value.invoiceId != 0) {
            onRating();
          }
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> deposit() async {
    await Get.toNamed(Routes.WALLET)!
        .then((value) => userInfo.value = AppDataGlobal.userInfo!);
  }

  Future<void> viewDetail(int id) async {
    await Get.toNamed(Routes.SERVICE, arguments: id);
  }

  Future<void> viewService(ServiceModel item) async {
    request.service = item;
    await _uiRepository.serviceView(item.id!).then((response) {});
    await Get.toNamed(Routes.SUPPLIER_FILTER, arguments: request);
  }

  Future<void> viewAllNews() async {
    await Get.toNamed(Routes.NEWS_LIST);
  }

  Future<void> viewNews(int id) async {
    await Get.toNamed(Routes.NEWS_DETAIL, arguments: id);
  }

  Future<void> actContinue(int id) async {
    await _uiRepository.serviceView(id).then((response) {});
    await Get.toNamed(Routes.SUPPLIER_FILTER, arguments: id);
  }

  Future<void> registerConsulting() async {
    await Get.toNamed(Routes.CONSULTING);
  }

  Future<void> onChatAdmin() async {
    if (AppDataGlobal.client == null) {
      return;
    }

    await EasyLoading.show();
    final _usersResponse = await AppDataGlobal.client?.queryUsers(
      filter: Filter.autoComplete(
          'id', AppDataGlobal.userInfo?.conversationInfo?.adminId ?? ''),
    );
    await EasyLoading.dismiss();
    await Get.toNamed(Routes.CHAT, arguments: {
      CommonConstants.CHANNEL: adminChatChannel,
      CommonConstants.CHAT_USER: (_usersResponse?.users.isEmpty ?? true)
          ? AppDataGlobal.userInfo?.conversationInfo?.getAdmin()
          : _usersResponse!.users.first,
      CommonConstants.IS_NOT_CALL: true,
    });
  }

  Future<void> onRating() async {
    try {
      await DialogUtil.showPopup(
        barrierDismissible: true,
        backgroundColor: Colors.transparent,
        child: RatingDialogWidget(
          id: homeModel.value.invoiceId,
          icon: homeModel.value.avatarSupplier,
          padding: 18,
          hintText: 'invoice.detail.hint_rating'.tr,
        ),
        onVaLue: (_value) {
          if (_value != null && _value is RatingRequest) {
            // call api rating
            EasyLoading.show();
            _uiRepository.invoiceRating(_value).then((response) {
              EasyLoading.dismiss();
              DialogUtil.showPopup(
                dialogSize: DialogSize.Popup,
                barrierDismissible: false,
                backgroundColor: Colors.transparent,
                child: NormalWidget(
                  icon: response.status == CommonConstants.statusOk
                      ? IconConstants.edit
                      : IconConstants.icFail,
                  title: response.message,
                ),
                onVaLue: (value) {},
              );
              return;
            });
          } else {
            print('cancel');
            EasyLoading.show();
            _uiRepository
                .invoiceCancelRating(homeModel.value.invoiceId ?? 0)
                .then((response) {
              EasyLoading.dismiss();
            });
          }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
