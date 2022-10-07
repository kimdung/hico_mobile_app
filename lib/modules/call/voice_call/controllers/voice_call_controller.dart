import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:wakelock/wakelock.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VoiceCallController extends BaseController {
  final appId = '898c8e034c484b02af88ef21f2056005';

  final _uiRepository = Get.find<HicoUIRepository>();

  RtcEngine? _engine;
  StreamSubscription? _callStreamSubscription;

  RxBool isJoined = RxBool(false);
  RxBool isCalling = RxBool(false);

  RxBool enableSpeakerphone = RxBool(false);
  RxBool openMicrophone = RxBool(true);

  final bool isCaller;
  final String token;
  final CallModel call;

  Timer? _durationTimer;
  final RxInt durationCall = RxInt(0);

  Timer? _timerRingwait;
  Timer? _timerAutoEncall;

  VoiceCallController(this.isCaller, this.call, this.token);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await Wakelock.enable();

    _addPostFrameCallback();

    await _initAgoraEngine();
  }

  @override
  void onClose() {
    Wakelock.disable();

    _endRingtone();

    _callEndCall();

    _engine?.leaveChannel();
    _engine?.destroy();

    _callStreamSubscription?.cancel();

    _durationTimer?.cancel();

    _timerAutoEncall?.cancel();

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

  Future<void> _initAgoraEngine() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    await _engine?.setParameters('{"che.audio.opensl":true}');

    await _addListeners();

    await _joinChannel();
  }

  Future<void> _addListeners() async {
    _engine?.setEventHandler(RtcEngineEventHandler(
      error: (errorCode) {
        printError(info: 'error $errorCode');
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        printInfo(info: 'joinChannelSuccess $channel $uid $elapsed');

        isJoined.value = true;
      },
      leaveChannel: (stats) {
        printError(info: 'leaveChannel ${stats.toJson()}');

        _endRingtone();

        isJoined.value = false;
      },
      userJoined: (uid, elapsed) {
        printInfo(info: 'userJoined $uid $elapsed');
        _timerAutoEncall?.cancel();

        _engine?.enableLocalAudio(true);

        _endRingtone();

        isCalling.value = true;

        _callBeginCall();
      },
      userOffline: (int uid, UserOfflineReason reason) {
        printInfo(info: 'userOffline $uid left channel');

        onEndCall();
      },
    ));

    await _engine?.enableAudio();
    await _engine?.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine?.setClientRole(ClientRole.Broadcaster);

    await _engine?.setEnableSpeakerphone(enableSpeakerphone.value);
    await _engine?.enableLocalAudio(false);
  }

  Future<void> _joinChannel() async {
    if (Platform.isAndroid) {
      await Permission.microphone.request();
    }
    await _engine
        ?.joinChannel(token, call.channelId ?? '', null, call.getId() ?? 0)
        .then((value) async {
      if (isCaller) {
        _startRingtone();

        _sendCallNotification();

        _timerAutoEncall = Timer.periodic(const Duration(minutes: 1), (timer) {
          onEndCall();
        });
      }
    }).catchError((onError) {
      printError(info: 'error ${onError.toString()}');
      Future.delayed(Duration.zero, Get.back);
    });
  }

  Future<void> switchMicrophone() async {
    // await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine?.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
    }).catchError((err) {
      printError(info: 'enableLocalAudio $err');
    });
  }

  void switchSpeakerphone() {
    _engine?.setEnableSpeakerphone(!enableSpeakerphone.value).then((value) {
      printError(info: 'setEnableSpeakerphone ${!enableSpeakerphone.value}');
      enableSpeakerphone.value = !enableSpeakerphone.value;
    }).catchError((err) {
      printError(info: 'setEnableSpeakerphone $err');
    });
  }

  Future<void> onEndCall() async {
    if (isCaller && !isCalling.value) {
      _sendMissCall();
    }
    _endRingtone();

    await _callEndCall();
  }

  void _startRingtone() {
    if (isCalling.value) {
      return;
    }
    if (AppDataGlobal.androidDeviceInfo?.version.sdkInt != null &&
        AppDataGlobal.androidDeviceInfo!.version.sdkInt! >= 28) {
      FlutterRingtonePlayer.play(
        fromAsset: 'lib/resource/assets_resources/bell/bell.mp3',
        looping: true,
      );
    } else {
      FlutterRingtonePlayer.play(
        fromAsset: 'lib/resource/assets_resources/bell/bell.mp3',
        looping: false,
      );
      _timerRingwait = Timer.periodic(const Duration(seconds: 4), (timer) {
        printInfo(info: 'playRingtone');
        FlutterRingtonePlayer.play(
          fromAsset: 'lib/resource/assets_resources/bell/bell.mp3',
          looping: false,
        );
      });
    }
  }

  void _endRingtone() {
    _timerRingwait?.cancel();
    _timerRingwait = null;
    FlutterRingtonePlayer.stop();
  }

  /* API */

  void _sendCallNotification() {
    // Gửi thông báo cuộc gọi mới cho server
    try {
      _uiRepository.sendCallNotification(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void _sendMissCall() {
    // Gửi thông báo server cuộc gọi nhỡ
    try {
      _uiRepository.sendMissCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> _callBeginCall() async {
    // Bắt đầu bộ đếm thời gian cuộc gọi
    _durationTimer ??= Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        durationCall.value++;
      },
    );

    // Gửi thông báo server bắt đầu cuộc gọi
    try {
      await _uiRepository.beginCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> _callEndCall() async {
    // Xóa cuộc gọi trên firebase
    await callMethods.endCall(call: call);

    // Gửi thông báo server kết thúc cuộc gọi
    try {
      await _uiRepository.endCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }

    Get.back();
  }
}
