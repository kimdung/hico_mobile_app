import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../data/app_data_global.dart';

class ChatUtil {
  static void initChat(String apiKey) {
    AppDataGlobal.client = StreamChatClient(apiKey, logLevel: Level.INFO);

    AppDataGlobal.client?.connectUser(
      AppDataGlobal.userInfo!.getChatUser(),
      AppDataGlobal.userInfo?.conversationInfo?.token ?? '',
    );

    AppDataGlobal.client
        ?.addDevice(AppDataGlobal.firebaseToken, PushProvider.firebase);

    AppDataGlobal.client?.on(
      EventType.messageNew,
      EventType.notificationMessageNew,
    );
  }
}
