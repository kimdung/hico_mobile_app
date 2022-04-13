import 'package:get/get.dart';
import 'package:ui_api/models/call/call_model.dart';

import '../../routes/app_pages.dart';
import '../constants/common.dart';
import '../methods/call_methods.dart';

class CallUtils {
  static dial(CallMethods callMethods, CallModel call, String token) async {
    final callMade = await callMethods.makeCall(call: call);
    call.hasDialled = true;

    if (callMade) {
      if (call.isVideo ?? false) {
        await Get.toNamed(Routes.VIDEO_CALL, arguments: {
          CommonConstants.IS_CALLER: true,
          CommonConstants.CALL_MODEL: call,
          CommonConstants.CALL_TOKEN: token,
        });
      } else {
        await Get.toNamed(Routes.VOICE_CALL, arguments: {
          CommonConstants.IS_CALLER: true,
          CommonConstants.CALL_MODEL: call,
          CommonConstants.CALL_TOKEN: token,
        });
      }
    }
  }
}
