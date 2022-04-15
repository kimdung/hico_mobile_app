import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/models/call/call_model.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VoiceCallController extends BaseController {
  final appId = 'fae0cb7e3f5c4c688ca32056eaa146b4';

  StreamSubscription? _callStreamSubscription;
  late final RtcEngine _engine;

  RxBool isRemoted = RxBool(false);
  RxBool isJoined = RxBool(false);
  RxBool openMicrophone = RxBool(true);
  RxBool enableSpeakerphone = RxBool(true);
  RxBool playEffect = RxBool(false);

  RxBool enableInEarMonitoring = RxBool(false);
  RxDouble recordingVolume = RxDouble(100);
  RxDouble playbackVolume = RxDouble(100);
  RxDouble inEarMonitoringVolume = RxDouble(100);

  final bool isCaller;
  final String token;
  final CallModel call;

  // Timer? _timer;
  // final RxInt callingTimer = RxInt(120);

  Timer? _durationTimer;
  final RxInt dutationCall = RxInt(0);

  VoiceCallController(this.isCaller, this.call, this.token);

  @override
  Future<void> onInit() async {
    // if (isCaller) {
    //   _timer = Timer.periodic(
    //     const Duration(seconds: 1),
    //     (Timer timer) {
    //       if (callingTimer.value <= 0) {
    //         _timer?.cancel();
    //         if (!isRemoted.value) {
    //           onEndCall();
    //         }
    //       } else {
    //         printInfo(info: 'callingTimer ${callingTimer.value}');
    //         callingTimer.value--;
    //       }
    //     },
    //   );
    // } else {
    //   callingTimer.value = 0;
    // }
    await super.onInit();

    _addPostFrameCallback();
    await _initEngine();
    await _joinChannel();
  }

  @override
  void onClose() {
    super.onClose();

    callMethods.endCall(call: call);
    _engine.leaveChannel();
    _engine.destroy();
    _callStreamSubscription?.cancel();
    // _timer?.cancel();
    _durationTimer?.cancel();
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
    // _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    _engine = await RtcEngine.create(appId);
    _engine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        printError(info: 'warning $warningCode');
      },
      error: (errorCode) {
        printError(info: 'error $errorCode');
      },
      userJoined: (uid, elapsed) {
        printInfo(info: 'userJoined $uid $elapsed');
        if (isCaller && _durationTimer == null) {
          _durationTimer = Timer.periodic(
            const Duration(seconds: 1),
            (Timer timer) {
              dutationCall.value++;
            },
          );
        }
        // else {
        //   callingTimer.value = 0;
        // }
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        printInfo(info: 'joinChannelSuccess $channel $uid $elapsed');
        isJoined.value = true;
        if (!isCaller && _durationTimer == null) {
          // callingTimer.value = 0;
          _durationTimer = Timer.periodic(
            const Duration(seconds: 1),
            (Timer timer) {
              dutationCall.value++;
            },
          );
        }
        // else {
        //   callingTimer.value = 0;
        // }
      },
      leaveChannel: (stats) async {
        printError(info: 'leaveChannel ${stats.toJson()}');
        isJoined.value = false;
      },
    ));

    await _engine.enableAudio();
    // await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    // await _engine.setClientRole(ClientRole.Broadcaster);
  }

  Future<void> _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await Permission.microphone.request();
    }

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

  Future<void> switchEffect() async {
    if (playEffect.value) {
      await _engine.stopEffect(1).then((value) {
        playEffect.value = false;
      }).catchError((err) {
        printError(info: 'stopEffect $err');
      });
    } else {
      final path =
          (await _engine.getAssetAbsolutePath('assets/Sound_Horizon.mp3'))!;
      await _engine
          .playEffect(1, path, 0, 1, 1, 100, openMicrophone.value)
          .then((value) {
        playEffect.value = true;
      }).catchError((err) {
        printError(info: 'playEffect $err');
      });
    }
  }

  Future<void> onChangeInEarMonitoringVolume(double value) async {
    inEarMonitoringVolume.value = value;
    await _engine.setInEarMonitoringVolume(inEarMonitoringVolume.toInt());
  }

  Future<void> toggleInEarMonitoring(bool value) async {
    enableInEarMonitoring.value = value;
    await _engine.enableInEarMonitoring(enableInEarMonitoring.value);
  }

  Future<void> onEndCall() async {
    await callMethods.endCall(call: call);
  }

  String formatTime(int secs) {
    final minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (secs % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
