import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../data/app_data_global.dart';

class ChatUtil {
  static Future<void> initChat(String apiKey) async {
    AppDataGlobal.client = StreamChatClient(apiKey, logLevel: Level.INFO);
    AppDataGlobal.client?.on(
      EventType.messageNew,
      EventType.notificationMessageNew,
    );
    await AppDataGlobal.client?.connectUser(
      AppDataGlobal.userInfo!.getChatUser(),
      AppDataGlobal.userInfo?.conversationInfo?.token ?? '',
    );

    await AppDataGlobal.client?.getDevices().then((listDevicesResponse) {
      var isExist = false;
      listDevicesResponse.devices.forEach((device) {
        if (device.id == AppDataGlobal.firebaseToken) {
          print('[ChatUtil] added firebaseToken');
          isExist = true;
        } else {
          AppDataGlobal.client?.removeDevice(device.id);
        }
      });
      if (!isExist) {
        print('[ChatUtil] new add firebaseToken');
        AppDataGlobal.client
            ?.addDevice(AppDataGlobal.firebaseToken, PushProvider.firebase);
      }
    });
  }
}
