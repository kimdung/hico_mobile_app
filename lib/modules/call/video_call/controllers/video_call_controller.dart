import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:wakelock/wakelock.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VideoCallController extends BaseController {
  final appId = 'fae0cb7e3f5c4c688ca32056eaa146b4';

  final _uiRepository = Get.find<HicoUIRepository>();

  late RtcEngine _engine;
  StreamSubscription? _callStreamSubscription;

  RxnInt remoteUid = RxnInt();
  RxBool isJoined = RxBool(false);

  RxBool muteLocalAudio = RxBool(false);

  final bool isCaller;
  final String token;
  final CallModel call;

  Timer? _durationTimer;
  final RxInt dutationCall = RxInt(0);

  VideoCallController(this.isCaller, this.token, this.call);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await Wakelock.enable();

    _addPostFrameCallback();
    await _initAgora();
    await _joinChannel();
  }

  @override
  void onClose() {
    onEndCall();
    _engine.leaveChannel();
    _engine.destroy();
    _durationTimer?.cancel();
    _callStreamSubscription?.cancel();
    Wakelock.disable();

    super.onClose();
  }

  void _addPostFrameCallback() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (AppDataGlobal.userInfo?.id == null) {
        return;
      }
      _callStreamSubscription = callMethods
          .callStream(uid: AppDataGlobal.userInfo!.id.toString())
          .listen((DocumentSnapshot ds) {
        if (ds.data() == null) {
          Get.back();
        }
      });
    });
  }

  Future<void> _initAgora() async {
    // Get permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    await _engine.enableVideo();
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
        callBeginCall();
        _durationTimer ??= Timer.periodic(
          const Duration(seconds: 1),
          (Timer timer) {
            dutationCall.value++;
          },
        );
      },
      userOffline: (int uid, UserOfflineReason reason) {
        printInfo(info: 'remote user $uid left channel');
        remoteUid.value = null;
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        printInfo(info: 'joinChannelSuccess $channel $uid $elapsed');
        isJoined.value = true;
      },
      leaveChannel: (stats) async {
        printError(info: 'leaveChannel ${stats.toJson()}');
        isJoined.value = false;
      },
    ));
  }

  Future<void> _joinChannel() async {
    await _engine
        .joinChannel(token, call.channelId ?? '', null, call.getId() ?? 0)
        .catchError((onError) {
      printError(info: 'error ${onError.toString()}');
      Future.delayed(Duration.zero, Get.back);
    });
  }

  Future<void> onToggleMute() async {
    await _engine.muteLocalAudioStream(!muteLocalAudio.value).then((value) {
      muteLocalAudio.value = !muteLocalAudio.value;
    }).catchError((err) {
      printError(info: 'muteLocalAudio $err');
    });
  }

  Future<void> onSwitchCamera() async {
    await _engine.switchCamera().catchError((err) {
      printError(info: 'onSwitchCamera $err');
    });
  }

  Future<void> onEndCall() async {
    await callMethods.endCall(call: call);
    await callEndCall();
  }

  /* API */

  Future<void> callBeginCall() async {
    try {
      await _uiRepository.beginCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> callEndCall() async {
    try {
      await _uiRepository.endCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
