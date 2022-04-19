import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:wakelock/wakelock.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VoiceCallController extends BaseController {
  final appId = 'fae0cb7e3f5c4c688ca32056eaa146b4';

  StreamSubscription? _callStreamSubscription;
  late final RtcEngine _engine;

  RxBool isRemoted = RxBool(false);
  RxBool isJoined = RxBool(false);

  RxBool enableSpeakerphone = RxBool(true);
  RxBool openMicrophone = RxBool(true);

  final bool isCaller;
  final String token;
  final CallModel call;

  Timer? _durationTimer;
  final RxInt dutationCall = RxInt(0);

  VoiceCallController(this.isCaller, this.call, this.token);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await Wakelock.enabled;

    _addPostFrameCallback();
    await _initEngine();
    await _joinChannel();
  }

  @override
  void onClose() {
    onEndCall();
    _engine.leaveChannel();
    _engine.destroy();
    _callStreamSubscription?.cancel();
    _durationTimer?.cancel();
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

  Future<void> _initEngine() async {
    // Get microphone permission
    await [Permission.microphone].request();

    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    _engine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        printError(info: 'warning $warningCode');
      },
      error: (errorCode) {
        printError(info: 'error $errorCode');
      },
      userJoined: (uid, elapsed) {
        printInfo(info: 'userJoined $uid $elapsed');
        isRemoted.value = true;
        _durationTimer ??= Timer.periodic(
          const Duration(seconds: 1),
          (Timer timer) {
            dutationCall.value++;
          },
        );
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

    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  Future<void> _joinChannel() async {
    await _engine
        .joinChannel(token, call.channelId ?? '', null, call.getId() ?? 0)
        .catchError((onError) {
      printError(info: 'error ${onError.toString()}');
      Future.delayed(Duration.zero, Get.back);
    });
  }

  Future<void> switchMicrophone() async {
    // await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
    }).catchError((err) {
      printError(info: 'enableLocalAudio $err');
    });
  }

  void switchSpeakerphone() {
    _engine.setEnableSpeakerphone(!enableSpeakerphone.value).then((value) {
      enableSpeakerphone.value = !enableSpeakerphone.value;
    }).catchError((err) {
      printError(info: 'setEnableSpeakerphone $err');
    });
  }

  Future<void> onEndCall() async {
    await callMethods.endCall(call: call);
  }
}
