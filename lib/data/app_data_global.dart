import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';

class AppDataGlobal {
  static String accessToken = '';
  static String languageCode = '';
  static String username = '';
  static String password = '';
  static String firebaseToken = '';
  static bool isLogin = false;

  static UserInfoModel? userInfo;
  static MasterDataModel? masterData;

  static StreamChatClient? client;
}
