import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/models/notifications/notification_data.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/invoice_request.dart';
import 'package:uuid/uuid.dart';

import '../../data/app_data_global.dart';
import '../../routes/app_pages.dart';
import '../constants/common.dart';
import '../constants/storage.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  final notificationData = NotificationData.fromJson(message.data);
  if (notificationData.displayType == NotificationData.typeIncomingCall) {
    await showCallkitIncoming(notificationData);
  }
}

Future<void> showCallkitIncoming(NotificationData notificationData) async {
  if (notificationData.receiverId == null) {
    return;
  }
  final callCollection = FirebaseFirestore.instance.collection('call');
  final doc = await callCollection.doc(notificationData.receiverId).get();
  final data = doc.data() as Map<String, dynamic>;
  try {
    final call = CallModel.fromJson(data);
    debugPrint(
        '[PickupLayout] showCallkitIncoming ${call.toJson().toString()}');
    if (call.hasDialled != null && !call.hasDialled!) {
      callCollection
          .doc(notificationData.receiverId)
          .snapshots()
          .listen((DocumentSnapshot ds) {
        if (ds.data() == null) {
          FlutterCallkitIncoming.endAllCalls();
        }
      });
      if (Platform.isIOS) {
        SharedPreferencesIOS.registerWith();
      } else if (Platform.isAndroid) {
        SharedPreferencesAndroid.registerWith();
      }
      final sp = await SharedPreferences.getInstance();
      final locale = sp.getString(StorageConstants.language) ?? VIETNAMESE_LANG;

      final String handle,
          channelName,
          textAccept,
          textDecline,
          textMissedCall,
          textCallback;
      switch (locale) {
        case ENGLISH_LANG:
          handle = (call.isVideo ?? false)
              ? 'Incoming video call...'
              : 'Incoming voice call...';
          channelName = 'Hico incoming call';
          textAccept = 'Accept';
          textDecline = 'Decline';
          textMissedCall = 'Missed Call';
          textCallback = 'Callback';
          break;
        case JAPANESE_LANG:
          handle = (call.isVideo ?? false) ? 'ビデオ通話の着信...' : '音声通話の着信...';
          channelName = 'Hico 着信';
          textAccept = '承認';
          textDecline = '却下';
          textMissedCall = '不在着信';
          textCallback = '折り返し電話';
          break;
        default:
          handle = (call.isVideo ?? false)
              ? 'Có cuộc gọi video...'
              : 'Có cuộc gọi âm thanh...';
          channelName = 'Hico có cuộc gọi đến';
          textAccept = 'Chấp nhận';
          textDecline = 'Từ chối';
          textMissedCall = 'Có cuộc gọi nhỡ';
          textCallback = 'Gọi lại';
      }

      await Get.updateLocale(const Locale('vi', 'VN'));

      final params = <String, dynamic>{
        'id': call.id ?? const Uuid().v4(),
        'appName': 'HICO',
        'nameCaller': call.callerName ?? '',
        'avatar': call.callerPic,
        'handle': handle,
        'type': (Platform.isIOS || (call.isVideo ?? false)) ? 1 : 0,
        'duration': 60000,
        'textAccept': textAccept,
        'textDecline': textDecline,
        'textMissedCall': textMissedCall,
        'textCallback': textCallback,
        // 'extra': <String, dynamic>{'userId': '1a2b3c4d'},
        // 'headers': <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
        'android': <String, dynamic>{
          'isCustomNotification': true,
          'isShowLogo': false,
          'isShowCallback': false,
          'isShowMissedCallNotification': false,
          'ringtonePath': 'bell',
          'backgroundColor': '#DF4D6F',
          'incomingCallNotificationChannelName': channelName,
        },
        'ios': <String, dynamic>{
          'iconName': 'AppIcon',
          'handleType': 'generic',
          'supportsVideo': true,
          'maximumCallGroups': 2,
          'maximumCallsPerCallGroup': 1,
          'audioSessionMode': 'default',
          'audioSessionActive': true,
          'audioSessionPreferredSampleRate': 44100.0,
          'audioSessionPreferredIOBufferDuration': 0.005,
          'supportsDTMF': true,
          'supportsHolding': true,
          'supportsGrouping': false,
          'supportsUngrouping': false,
          'ringtonePath': 'bell.caf'
        }
      };
      FlutterCallkitIncoming.onEvent.listen((event) async {
        switch (event!.name) {
          case CallEvent.ACTION_CALL_INCOMING:
            break;
          case CallEvent.ACTION_CALL_START:
            break;
          case CallEvent.ACTION_CALL_ACCEPT:
            AppDataGlobal.acceptCall = true;
            break;
          case CallEvent.ACTION_CALL_DECLINE:
            try {
              await callCollection.doc(call.callerId.toString()).delete();
            } catch (e) {
              debugPrint(e.toString());
            }
            try {
              await callCollection.doc(call.receiverId.toString()).delete();
            } catch (e) {
              debugPrint(e.toString());
            }
            await FlutterCallkitIncoming.endAllCalls();
            break;
          case CallEvent.ACTION_CALL_ENDED:
            break;
          case CallEvent.ACTION_CALL_TIMEOUT:
            break;
          case CallEvent.ACTION_CALL_CALLBACK:
            break;
          case CallEvent.ACTION_CALL_TOGGLE_HOLD:
            break;
          case CallEvent.ACTION_CALL_TOGGLE_MUTE:
            break;
          case CallEvent.ACTION_CALL_TOGGLE_DMTF:
            break;
          case CallEvent.ACTION_CALL_TOGGLE_GROUP:
            break;
          case CallEvent.ACTION_CALL_TOGGLE_AUDIO_SESSION:
            break;
          case CallEvent.ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP:
            break;
        }
      });
      await FlutterCallkitIncoming.showCallkitIncoming(params);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

/// https://firebase.flutter.dev/docs/messaging/usage/
class FirebaseMessageConfig {
  static final FirebaseMessageConfig _singleton =
      FirebaseMessageConfig._internal();

  final _uiRepository = Get.find<HicoUIRepository>();

  factory FirebaseMessageConfig() {
    return _singleton;
  }

  FirebaseMessageConfig._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel _androidNotificationChannel =
      const AndroidNotificationChannel(
    'hico_high_importance_channel',
    'Hico High Importance Notifications',
    importance: Importance.max,
    enableLights: true,
    enableVibration: true,
    playSound: true,
    showBadge: true,
  );

  Future<void> initFirebaseMessageConfig() async {
    await _initFirebaseMessaging();
    await _initLocalNotification();
  }

  Future<void> _initFirebaseMessaging() async {
    try {
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );

      // Hiển thị notification khi bật app cho ios
      if (Platform.isIOS) {
        await _firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
      await _firebaseMessaging.setAutoInitEnabled(true);

      await _handleTokenFirebase();
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> _initLocalNotification() async {
    try {
      const initialzationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      final initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
        onDidReceiveLocalNotification:
            (int? id, String? title, String? body, String? payload) async {
          if (payload?.isNotEmpty ?? false) {
            /// ['id']: Key json chứa ID của thông báo server trả về.
            /// Dùng để điều hướng vào màn chi tiết thông báo
            /// Mặc định đang là ['id']
            // Navigator.of(AppConfig.navigatorKey.currentContext).pushNamed(
            //   DetailNotificationScreen.routeName,
            //   arguments: int.tryParse(
            //     json.decode(payload)['id']?.toString(),
            //   ),
            // );
          }
        },
      );

      final initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (payload) {
          if (payload?.isEmpty ?? true) {
            return;
          }
          final message = jsonDecode(payload ?? '');
          debugPrint('ONTAP onSelectNotification');
          _onSelectNotifcation(message);
        },
      );

      if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      } else if (Platform.isAndroid) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(_androidNotificationChannel);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> handleMessage() async {
    try {
      /// Lấy tất cả thông báo khiến ứng dụng mở từ terminated state
      /// Một khi lấy ra thông báo để điều hướng, nó sẽ bị remove
      /// Tương tác với thông báo khi ứng dụng đang ở terminated
      final initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        if (initialMessage.data.isNotEmpty) {
          /// ['id']: Key json chứa ID của thông báo server trả về.
          /// Dùng để điều hướng vào màn chi tiết thông báo
          /// Mặc định đang là ['id']
          // Navigator.of(AppConfig.navigatorKey.currentContext).pushNamed(
          //   DetailNotificationScreen.routeName,
          //   arguments: int.tryParse(
          //     initialMessage?.data['id']?.toString(),
          //   ),
          // );
        }
      }

      /// Khi đang mở ứng dụng, thông báo Firebase sẽ vào hàm onMessage
      /// Android sẽ block toàn bộ thông báo đẩy, cần cấu hình thêm thư viện flutter_local_notifications để hiển thị thông báo cũng như tương tác thông báo
      /// IOS cần call hàm setForegroundNotificationPresentationOptions để nhận thông báo khi đang mở ứng dụng
      FirebaseMessaging.onMessage.listen(_showNotification);

      /// Tương tác với thông báo khi ứng dụng đang ở background và khi đang khóa màn hình
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('ONTAP onMessageOpenedApp: ${message.data.toString()}');

        /// ['id']: Key json chứa ID của thông báo server trả về.
        /// Dùng để điều hướng vào màn chi tiết thông báo
        /// Mặc định đang là ['id']
        _onSelectNotifcation(message.data);
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  void _showNotification(RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    try {
      debugPrint('FirebaseMessageConfig RemoteMessage $message');

      final remoteNotification = message.notification;
      final android = message.notification?.android;

      if (remoteNotification != null && android != null) {
        _flutterLocalNotificationsPlugin.show(
          remoteNotification.hashCode,
          remoteNotification.title,
          remoteNotification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidNotificationChannel.id,
              _androidNotificationChannel.name,
              importance: Importance.high,
              visibility: NotificationVisibility.public,
              priority: Priority.high,
              playSound: true,
              enableLights: true,
              enableVibration: true,
            ),
            iOS: IOSNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: remoteNotification.title,
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    } catch (e) {
      debugPrint('FirebaseMessageConfig $e');
    }
  }

  Future<void> _onSelectNotifcation(Map<String, dynamic> message) async {
    debugPrint('ONTAP NOTIFICATION: $message');
    if (message.isEmpty) {
      return;
    }

    /// ['id']: Key json chứa ID của thông báo server trả về.
    /// Dùng để điều hướng vào màn chi tiết thông báo
    /// Mặc định đang là ['id']
    // try {
    //   final type = message['display_type']?.toString();
    //   final id = message['invoice_id']?.toString();
    //   if (type == DisplayType.Extend.id.toString()) {
    //     await Navigator.of(AppDataGlobal.navigatorKey.currentContext!)
    //         .pushNamed(Routes.ORDER_DETAIL,
    //             arguments: InvoiceRequest(id: int.parse(id!), extend: true));
    //   } else if (type == DisplayType.Rating.id.toString()) {
    //     await Navigator.of(AppDataGlobal.navigatorKey.currentContext!)
    //         .pushNamed(Routes.ORDER_DETAIL,
    //             arguments: InvoiceRequest(id: int.parse(id!), rating: true));
    //   }
    // } catch (e) {
    //   print(e);
    // }

    //FCM Firebase
    final type = message['display_type']?.toString();
    final id = message['invoice_id']?.toString();

    //FCM GetStream
    final sender = message['sender']?.toString();
    final channelId = message['channel_id'] ?? '';

    if (type == DisplayType.Order.id.toString() ||
        type == DisplayType.Remind.id.toString()) {
      await Navigator.of(AppDataGlobal.navigatorKey.currentContext!).pushNamed(
          Routes.ORDER_DETAIL,
          arguments: InvoiceRequest(id: int.parse(id!)));
    } else if (type == DisplayType.Extend.id.toString()) {
      await Navigator.of(AppDataGlobal.navigatorKey.currentContext!).pushNamed(
          Routes.ORDER_DETAIL,
          arguments: InvoiceRequest(id: int.parse(id!), extend: true));
    } else if (type == DisplayType.Rating.id.toString()) {
      await Navigator.of(AppDataGlobal.navigatorKey.currentContext!).pushNamed(
          Routes.ORDER_DETAIL,
          arguments: InvoiceRequest(id: int.parse(id!), rating: true));
    } else if (sender == 'stream.chat' && channelId.isNotEmpty) {
      //router chat screen
      debugPrint('router chat screen');
      await onChat(channelId);
    }
  }

  Future<void> resetDeviceToken() async {
    await _firebaseMessaging.deleteToken();
  }

  Future<void> _handleTokenFirebase() async {
    await _firebaseMessaging.getToken().then((String? token) async {
      debugPrint('FIREBASE TOKEN: $token');
      if (token != null) {
        AppDataGlobal.firebaseToken = token;
        await AppDataGlobal.client?.addDevice(token, PushProvider.firebase);
      }
    });
    _firebaseMessaging.onTokenRefresh.listen((token) {
      debugPrint('TOKEN FIREBASE CHANGE: $token');
      AppDataGlobal.firebaseToken = token;
      AppDataGlobal.client?.addDevice(token, PushProvider.firebase);
    });
  }

  Future<void> onChat(String channelId) async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!.channel('messaging', id: channelId);
    final ids = channelId.split('-');
    final userId = ids
        .firstWhereOrNull((id) => id != AppDataGlobal.userInfo?.id.toString());
    if (userId == null) {
      return;
    }
    await AppDataGlobal.client
        ?.queryUsers(filter: Filter.autoComplete('id', userId))
        .then((response) {
      if (response.users.isEmpty) {
        return;
      }
      Get.toNamed(Routes.CHAT, arguments: {
        CommonConstants.CHANNEL: channel,
        CommonConstants.CHAT_USER: response.users.first,
      });
    });
  }

  Future<void> reloadBalance() async {
    await _uiRepository.getInfo().then((response) {
      if (response.status == CommonConstants.statusOk &&
          response.data != null &&
          response.data!.info != null) {
        AppDataGlobal.userInfo = response.data!.info!;
      }
    });
  }
}
