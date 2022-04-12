import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/models/call/call_model.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VideoCallController extends BaseController {
  final appId = 'fae0cb7e3f5c4c688ca32056eaa146b4';

  RxnInt remoteUid = RxnInt();
  // RxBool localUserJoined = RxBool(false);
  RxBool isJoined = RxBool(false);
  late RtcEngine _engine;
  StreamSubscription? callStreamSubscription;

  final bool isCaller;
  final String token;
  final CallModel call;

  Timer? _timer;
  final RxInt callingTimer = RxInt(120);

  Timer? _durationTimer;
  final RxInt dutationCall = RxInt(0);

  VideoCallController(this.isCaller, this.token, this.call);

  @override
  Future<void> onInit() async {
    await super.onInit();
    if (isCaller) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          if (callingTimer.value == 0) {
            _timer?.cancel();
            onEndCall();
          } else {
            callingTimer.value--;
          }
        },
      );
    } else {
      callingTimer.value = 0;
    }

    _addPostFrameCallback();
    await _initAgora();
  }

  @override
  void dispose() {
    super.dispose();
    onEndCall();
    _engine.destroy();
    callStreamSubscription?.cancel();
    _timer?.cancel();
    _durationTimer?.cancel();
  }

  void _addPostFrameCallback() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (AppDataGlobal.userInfo?.id == null) {
        return;
      }
      callStreamSubscription = callMethods
          .callStream(uid: AppDataGlobal.userInfo!.id.toString())
          .listen((DocumentSnapshot ds) {
        if (ds.data() == null) {
          Get.back();
        }
      });
    });
  }

  Future<void> _initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    // _engine.setEventHandler(
    //   RtcEngineEventHandler(
    //     joinChannelSuccess: (String channel, int uid, int elapsed) {
    //       printInfo(info: 'local user $uid joined');
    //       localUserJoined = true.obs;
    //     },
    //     userJoined: (int uid, int elapsed) {
    //       printInfo(info: 'remote user $uid joined');
    //       remoteUid.value = uid;
    //     },
    //     userOffline: (int uid, UserOfflineReason reason) {
    //       printInfo(info: 'remote user $uid left channel');
    //       remoteUid.value = null;
    //     },
    //   ),
    // );

    _engine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        printError(info: 'warning $warningCode');
      },
      error: (errorCode) {
        printError(info: 'error $errorCode');
      },
      userJoined: (uid, elapsed) {
        printInfo(info: 'userJoined $uid $elapsed');
        remoteUid.value = uid;
        if (isCaller && _durationTimer == null) {
          _durationTimer = Timer.periodic(
            const Duration(seconds: 1),
            (Timer timer) {
              dutationCall.value++;
            },
          );
        } else {
          callingTimer.value = 0;
        }
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        printInfo(info: 'joinChannelSuccess $channel $uid $elapsed');
        isJoined.value = true;
        if (!isCaller && _durationTimer == null) {
          _durationTimer = Timer.periodic(
            const Duration(seconds: 1),
            (Timer timer) {
              dutationCall.value++;
            },
          );
        } else {
          callingTimer.value = 0;
        }
      },
      leaveChannel: (stats) async {
        printError(info: 'leaveChannel ${stats.toJson()}');
        isJoined.value = false;
      },
    ));

    await _engine.joinChannel(token, call.channelId ?? '', null, 0);
  }

  Future<void> onEndCall() async {
    await callMethods.endCall(call: call);
  }
}
