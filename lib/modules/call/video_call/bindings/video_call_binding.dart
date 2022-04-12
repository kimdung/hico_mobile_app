import 'package:get/get.dart';

import '../../../../shared/constants/common.dart';
import '../controllers/video_call_controller.dart';

class VideoCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoCallController>(() {
      final arguments = Get.arguments as Map;
      final isCaller = arguments[CommonConstants.IS_CALLER];
      final call = arguments[CommonConstants.CALL_MODEL];
      final token = arguments[CommonConstants.CALL_TOKEN];
      return VideoCallController(isCaller, token, call);
    });
  }
}
