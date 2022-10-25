import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../shared/methods/call_methods.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import 'pickup_view.dart';

class PickupLayout extends GetView<BaseController> {
  final Widget scaffold;
  final CallMethods callMethods;

  PickupLayout(
    this.callMethods, {
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final userInfo = AppDataGlobal.userInfo;
    return (userInfo != null && userInfo.id != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: userInfo.id.toString()),
            builder: (context, snapshot) {
              if (WidgetsBinding.instance?.lifecycleState == null ||
                  WidgetsBinding.instance?.lifecycleState !=
                      AppLifecycleState.resumed) {
                return scaffold;
              }
              if (snapshot.hasData &&
                  snapshot.data?.data() != null &&
                  snapshot.data?.data() is Map<String, dynamic>) {
                return FutureBuilder<CallModel?>(
                  future: _pickupCall(
                      snapshot.data?.data() as Map<String, dynamic>),
                  builder: (BuildContext context,
                      AsyncSnapshot<CallModel?> snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return PickupView(call: snapshot.data!);
                    } else {
                      return scaffold;
                    }
                  },
                );
              }
              return scaffold;
            },
          )
        : const Scaffold(
            body: Center(),
          );
  }

  Future<CallModel?>? _pickupCall(Map<String, dynamic> data) async {
    try {
      final storage = Get.find<SharedPreferences>();
      final isAcceptCall =
          storage.getBool(StorageConstants.isAcceptCall) ?? false;

      final call = CallModel.fromJson(data);
      if (AppDataGlobal.acceptCall || isAcceptCall) {
        AppDataGlobal.acceptCall = false;
        await storage.setBool(StorageConstants.isAcceptCall, false);
        await onAcceptCall(call);
        return null;
      }

      final activeCalls = await FlutterCallkitIncoming.activeCalls();
      if (activeCalls is List && activeCalls.isNotEmpty) {
        final activeCall = activeCalls.firstWhereOrNull(
            (element) => (element as Map<dynamic, dynamic>?)?['id'] == call.id);
        if (activeCall != null && (activeCall['isAccepted'] ?? false)) {
          await onAcceptCall(call);
        }
        return null;
      }

      if (call.hasDialled != null && !call.hasDialled!) {
        return call;
      }
    } catch (e) {
      printError(info: '[PickupLayout] $e');
      return null;
    }
    return null;
  }

  Future<void> onAcceptCall(CallModel call) async {
    if (call.channelId == null) {
      await callMethods.endCall(call: call);
      return;
    }
    final _uiRepository = Get.find<HicoUIRepository>();
    await EasyLoading.show();

    await _uiRepository
        .getCallToken(call.channelId ?? '', call.invoiceId)
        .then((response) {
      EasyLoading.dismiss();
      if (response.status == CommonConstants.statusOk) {
        if (call.isVideo ?? false) {
          Get.toNamed(Routes.VIDEO_CALL, arguments: {
            CommonConstants.IS_CALLER: false,
            CommonConstants.CALL_MODEL: call,
            CommonConstants.CALL_TOKEN: response.data?.token ?? '',
          });
        } else {
          Get.toNamed(Routes.VOICE_CALL, arguments: {
            CommonConstants.IS_CALLER: false,
            CommonConstants.CALL_MODEL: call,
            CommonConstants.CALL_TOKEN: response.data?.token ?? '',
          });
        }
      } else {
        callMethods.endCall(call: call);
      }
    }).catchError((error) {
      printError(info: error.toString());

      EasyLoading.dismiss();

      callMethods.endCall(call: call);
    });
  }

  Future<void> onDeniedCall(CallModel call) async {
    await callMethods.endCall(call: call);
  }
}
