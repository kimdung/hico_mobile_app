import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../shared/constants/common.dart';

class ChatController extends BaseController {
  late Channel channel;
  late User user;
  late bool isNotCall;

  @override
  Future<void> onInit() async {
    final arguments = Get.arguments as Map;
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
}
