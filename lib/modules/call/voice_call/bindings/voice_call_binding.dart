import 'package:get/get.dart';

import '../../../../shared/constants/common.dart';
import '../controllers/voice_call_controller.dart';

class VoiceCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceCallController>(
      () {
        final arguments = Get.arguments as Map;
        final isCaller = arguments[CommonConstants.IS_CALLER];
        final call = arguments[CommonConstants.CALL_MODEL];
        final token = arguments[CommonConstants.CALL_TOKEN];
        return VoiceCallController(isCaller, call, token);
      },
    );
  }
}
