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

class VideoCallController extends BaseController {
  final appId = '898c8e034c484b02af88ef21f2056005';

  final _uiRepository = Get.find<HicoUIRepository>();

  RtcEngine? _engine;
  StreamSubscription? _callStreamSubscription;

  RxnInt remoteUid = RxnInt();
  RxBool isCalling = RxBool(false);
  RxBool isJoined = RxBool(false);

  RxBool muteLocalAudio = RxBool(false);

  final bool isCaller;
  final String token;
  final CallModel call;

  Timer? _durationTimer;
  final RxInt dutationCall = RxInt(0);

  Timer? _timerRingwait;
  Timer? _timerAutoEncall;

  VideoCallController(this.isCaller, this.token, this.call);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await Wakelock.enable();

    _addPostFrameCallback();

    await _initAgoraEngine();
  }

  @override
  Future<void> onResumed() async {
    await _engine?.disableVideo();
    await _engine?.enableVideo();

    await super.onResumed();
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
    //create the engine
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    await _engine?.setParameters('{"che.audio.opensl":true}');

    _addListeners();

    await _engine?.enableVideo();
    await _engine?.startPreview();
    await _engine?.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine?.setClientRole(ClientRole.Broadcaster);

    await _joinChannel();
  }

  void _addListeners() {
    _engine?.setEventHandler(RtcEngineEventHandler(
      error: (errorCode) {
        printInfo(info: 'error $errorCode');
      }, 
      joinChannelSuccess: (channel, uid, elapsed) {
        printInfo(info: 'joinChannelSuccess $channel $uid $elapsed');

        isJoined.value = true;
      },
      leaveChannel: (stats) {
        printInfo(info: 'leaveChannel ${stats.toJson()}');

        _endRingtone();

        isJoined.value = false;
      },
      userJoined: (uid, elapsed) {
        printInfo(info: 'userJoined $uid $elapsed');

        _timerAutoEncall?.cancel();

        _endRingtone();

        remoteUid.value = uid;
        isCalling.value = true;

        _callBeginCall();
      },
      userOffline: (int uid, UserOfflineReason reason) {
        printInfo(info: 'remote user $uid left channel');
        remoteUid.value = null;

        onEndCall();
      },
    ));
  }

  Future<void> _joinChannel() async {
    if (Platform.isAndroid) {
      await [Permission.microphone, Permission.camera].request();
    }
    await _engine
        ?.joinChannel(token, call.channelId ?? '', null, call.getId() ?? 0)
        .then((value) {
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

  Future<void> onToggleMute() async {
    await _engine?.muteLocalAudioStream(!muteLocalAudio.value).then((value) {
      muteLocalAudio.value = !muteLocalAudio.value;
    }).catchError((err) {
      printError(info: 'muteLocalAudio $err');
    });
  }

  Future<void> onSwitchCamera() async {
    await _engine?.switchCamera().catchError((err) {
      printError(info: 'onSwitchCamera $err');
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

  Future<void> _sendCallNotification() async {
    try {
      await _uiRepository.sendCallNotification(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void _sendMissCall() {
    try {
      _uiRepository.sendMissCall(call.invoiceId ?? -1);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> _callBeginCall() async {
    _durationTimer ??= Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        dutationCall.value++;
      },
    );

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
  }
}
