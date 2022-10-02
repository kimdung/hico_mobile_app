import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
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

  static bool acceptCall = false;

  static UserInfoModel? userInfo;
  static MasterDataModel? masterData;
  static AndroidDeviceInfo? androidDeviceInfo;

  static StreamChatClient? client;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
