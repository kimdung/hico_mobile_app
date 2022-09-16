import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/call_utilities.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class ChatController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  late Channel channel;
  late User user;
  late bool isNotCall;
  int? invoiceId;

  @override
  Future<void> onInit() async {
    final arguments = Get.arguments as Map;
    invoiceId = arguments[CommonConstants.INVOICE_ID];
    channel = arguments[CommonConstants.CHANNEL];
    user = arguments[CommonConstants.CHAT_USER];
    isNotCall = arguments[CommonConstants.IS_NOT_CALL] ?? false;
    await channel.watch();

    final addMembers = [user.id];
    if (AppDataGlobal.userInfo?.id != null) {
      addMembers.add(AppDataGlobal.userInfo!.id!.toString());
    }
    await channel.addMembers(addMembers);

    await super.onInit();
  }

  Future<void> onCall() async {
    final channelId = channel.id;
    if (channelId == null) {
      return;
    }
    try {
      await EasyLoading.show();
      await _uiRepository.getCallToken(channelId, invoiceId).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk) {
          final call = CallModel(
            invoiceId: invoiceId,
            callerId: AppDataGlobal.userInfo?.id,
            callerName: AppDataGlobal.userInfo?.name ?? '',
            callerPic: AppDataGlobal.userInfo?.avatarImage ?? '',
            receiverId: int.tryParse(user.id),
            receiverName: user.name,
            receiverPic: user.image ?? '',
            channelId: channelId,
            hasDialled: true,
            isVideo: false,
          );
          CallUtils.dial(callMethods, call, response.data?.token ?? '');
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: response.message ?? 'error.call'.tr,
            ),
          );
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onVideo() async {
    final channelId = channel.id;
    if (channelId == null) {
      return;
    }
    try {
      await EasyLoading.show();
      await _uiRepository.getCallToken(channelId, invoiceId).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk) {
          final call = CallModel(
            invoiceId: invoiceId,
            callerId: AppDataGlobal.userInfo?.id,
            callerName: AppDataGlobal.userInfo?.name ?? '',
            callerPic: AppDataGlobal.userInfo?.avatarImage ?? '',
            receiverId: int.tryParse(user.id),
            receiverName: user.name,
            receiverPic: user.image ?? '',
            channelId: channelId,
            hasDialled: true,
            isVideo: true,
          );
          CallUtils.dial(callMethods, call, response.data?.token ?? '');
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: response.message ?? 'error.call'.tr,
            ),
          );
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
