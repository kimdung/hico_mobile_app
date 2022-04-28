import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/rating_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/widget_hico/dialog/order_extend_widget.dart';
import '../../../shared/widget_hico/dialog/time_extend_widget.dart';
import '../../../shared/utils/call_utilities.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widget_hico/dialog/rating_widget.dart';
import '../../../shared/widget_hico/dialog/text_field_widget.dart';
import '../../../shared/widget_hico/dialog/time_extend_widget.dart';
import '../../../shared/widget_hico/invoice/cancel_invoice_widget.dart';

enum OrderInfoViewType { Text, Button, Status }

class OrderController extends BaseController {
  final Rx<int> showExtend = Rx(0);
  final _uiRepository = Get.find<HicoUIRepository>();
  final invoice = Rx(InvoiceInfoModel());
  int id = 0;

  @override
  Future<void> onInit() async {
    await super.onInit();

    id = Get.arguments;
    await _loadData();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await showDialogNotification();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.invoiceDetail(id).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.detail != null) {
          invoice.value = response.data!.detail!;
          return;
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
            onVaLue: (value) {
              Get.back();
            },
          );
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'error_mess'.tr,
        ),
        onVaLue: (value) {
          Get.back();
        },
      );
      return;
    }
  }

  Future<void> changeSupplierRequest() async {
    try {
      await EasyLoading.show();
      await _uiRepository.changeSupplierRequest(id).then(
        (response) {
          EasyLoading.dismiss();
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
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> editRequest() async {
    try {
      await EasyLoading.show();
      await _uiRepository.editInvoiceRequest(id).then((response) {
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
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onChat() async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!.channel(
      'messaging',
      id: invoice.value.getChatChannel(),
    );
    final _usersResponse = await AppDataGlobal.client?.queryUsers(
      filter: Filter.autoComplete('id', invoice.value.supplierId.toString()),
    );
    await Get.toNamed(Routes.CHAT, arguments: {
      CommonConstants.CHANNEL: channel,
      CommonConstants.CHAT_USER: (_usersResponse?.users.isEmpty ?? true)
          ? invoice.value.getProvider()
          : _usersResponse!.users.first,
    });
  }

  Future<void> onCall() async {
    if (AppDataGlobal.userInfo == null) {
      return;
    }
    final channelId = invoice.value.getCallChannel();

    try {
      await EasyLoading.show();
      await _uiRepository.getCallToken(channelId).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          final call = CallModel(
            callerId: AppDataGlobal.userInfo?.id,
            callerName: AppDataGlobal.userInfo?.name ?? '',
            callerPic: AppDataGlobal.userInfo?.avatarImage ?? '',
            receiverId: invoice.value.supplierId,
            receiverName: invoice.value.supplierName ?? '',
            receiverPic: invoice.value.supplierAvatar ?? '',
            channelId: channelId,
            hasDialled: true,
            isVideo: false,
          );
          CallUtils.dial(callMethods, call, response.data?.token ?? '');
        } else if (response.message?.isNotEmpty ?? false) {
          EasyLoading.showToast(response.message ?? '');
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onVideo() async {
    final channelId = invoice.value.getCallChannel();
    try {
      await EasyLoading.show();
      await _uiRepository.getCallToken(channelId).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          final call = CallModel(
            callerId: AppDataGlobal.userInfo?.id,
            callerName: AppDataGlobal.userInfo?.name ?? '',
            callerPic: AppDataGlobal.userInfo?.avatarImage ?? '',
            receiverId: invoice.value.supplierId,
            receiverName: invoice.value.supplierName ?? '',
            receiverPic: invoice.value.supplierAvatar ?? '',
            channelId: channelId,
            hasDialled: true,
            isVideo: true,
          );
          CallUtils.dial(callMethods, call, response.data?.token ?? '');
        } else if (response.message?.isNotEmpty ?? false) {
          EasyLoading.showToast(response.message ?? '');
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onExtend() async {}

  Future<void> onRating() async {
    try {
      await DialogUtil.showPopup(
        barrierDismissible: true,
        height: 397,
        backgroundColor: AppColor.primaryBackgroundColorLight,
        onPress: () {},
        child: RatingDialogWidget(
          id: id,
          height: 397,
          icon: invoice.value.supplierAvatar,
          padding: 18,
          hintText: 'invoice.detail.hint_rating'.tr,
        ),
        onVaLue: (_value) {
          if (_value != null && _value is RatingRequest) {
            // call api rating
            EasyLoading.show();
            _uiRepository.editInvoiceRequest(id).then((response) {
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
          }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> cancel() async {
    try {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        height: invoice.value.isFined == 0 ? 292 : 270,
        backgroundColor: AppColor.primaryBackgroundColorLight,
        onPress: () {},
        child: TextDialogWidget(
          height: invoice.value.isFined == 0 ? 292 : 270,
          icon: invoice.value.isFined == 0
              ? IconConstants.icFund
              : IconConstants.icFail,
          padding: invoice.value.isFined == 0 ? 10 : 32,
          hintText: 'invoice.detail.hint_cancel'.tr,
          titleWidget: CancelInvoiceWidget(
            total: invoice.value.total,
            isFined: invoice.value.isFined,
          ),
        ),
        onVaLue: (_value) {
          if (_value != null && _value is String) {
            // call api cancel
            EasyLoading.show();
            _uiRepository.invoiceCancel(id, _value).then((response) {
              EasyLoading.dismiss();
              if (response.status != CommonConstants.statusOk) {
                DialogUtil.showPopup(
                  dialogSize: DialogSize.Popup,
                  barrierDismissible: false,
                  backgroundColor: Colors.transparent,
                  child: NormalWidget(
                    icon: IconConstants.icFail,
                    title: response.message,
                  ),
                  onVaLue: (value) {},
                );
              }
              return;
            });
          }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {}

  //tr(String s) {}

  Future<void> showDialogNotification() async {
    try {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: const OrderExrendWidget(),
        onVaLue: (_value) {
          if (_value != null && _value is int) {
            if (_value == 1) {
              Get.toNamed(Routes.TIME_EXTENSION, arguments: id);
            }
        }
        },
      );
      return;
    } catch (e) {
      await EasyLoading.dismiss();
    }
    // await DialogUtil.showPopup(
    //   dialogSize: DialogSize.Popup,
    //   barrierDismissible: false,
    //   backgroundColor: Colors.transparent,
    //   child: const TimeExtendWidget(),
    //   onVaLue: (_value) {
          
    //   },
    // );
  }
}
