import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';
import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:wakelock/wakelock.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';

class VoiceCallController extends BaseController {
  final appId = '898c8e034c484b02af88ef21f2056005';

  final _uiRepository = Get.find<HicoUIRepository>();

  late final RtcEngine _engine;
  StreamSubscription? _callStreamSubscription;

  RxBool isJoined = RxBool(false);
  RxBool isCalling = RxBool(false);

  RxBool enableSpeakerphone = RxBool(false);
  RxBool openMicrophone = RxBool(true);

  bool isChangeCall = false;

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

    await _initStreamListener();
    await _initAgoraEngine();
  }

  @override
  void onClose() {
    Wakelock.disable();

    _endRingtone();

    _callEndCall();

    _engine.leaveChannel();
    _engine.release();

    _callStreamSubscription?.cancel();

    _durationTimer?.cancel();

    _timerAutoEncall?.cancel();

    super.onClose();
  }

  Future<void> _initStreamListener() async {
    // Call
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (AppDataGlobal.userInfo?.id == null) {
        return;
      }
      _callStreamSubscription = callMethods
          .callStream(uid: AppDataGlobal.userInfo!.id.toString())
          .listen((DocumentSnapshot snapshot) {
        final data = snapshot.data();
        if (data != null && data is Map<String, dynamic>) {
          final callModel = CallModel.fromJson(data);
          if (call.channelId != callModel.channelId) {
            isChangeCall = true;
            Get.back();
          }
        } else {
          Get.back();
        }
      });
    });

    if (Platform.isAndroid) {
      final status = await Permission.phone.request();
      if (status == PermissionStatus.granted) {
        PhoneState.phoneStateStream.listen((event) {
          if (event == PhoneStateStatus.CALL_STARTED) {
            _callEndCall();
          }
        });
      }
    } else {
      PhoneState.phoneStateStream.listen((event) {
        if (event == PhoneStateStatus.CALL_STARTED) {
          _callEndCall();
        }
      });
    }
  }

  Future<void> _initAgoraEngine() async {
    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    await _engine.setParameters('{"che.audio.opensl":true}');

    await _addListeners();

    await _joinChannel();
  }

  Future<void> _addListeners() async {
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          printInfo(
              info:
                  'joinChannelSuccess ${connection.channelId} ${connection.localUid} $elapsed');

          isJoined.value = true;

          _engine.setEnableSpeakerphone(enableSpeakerphone.value);
          _engine.enableLocalAudio(false);
        },
        onLeaveChannel: (connection, stats) {
          printError(info: 'leaveChannel ${stats.toJson()}');

          _endRingtone();

          isJoined.value = false;
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          printInfo(info: 'userJoined $remoteUid $elapsed');
          _timerAutoEncall?.cancel();

          _engine.enableLocalAudio(true);
          _engine.enableAudio();
          _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
          _engine.setAudioProfile(
            profile: AudioProfileType.audioProfileDefault,
            scenario: AudioScenarioType.audioScenarioGameStreaming,
          );

          _endRingtone();

          isCalling.value = true;

          _callBeginCall();
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          printInfo(info: 'userOffline $remoteUid left channel');

          onEndCall();
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {},
      ),
    );

    // await _engine.enableAudio();
    // await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    // await _engine.setAudioProfile(
    //   profile: AudioProfileType.audioProfileDefault,
    //   scenario: AudioScenarioType.audioScenarioGameStreaming,
    // );

    // await _engine.setEnableSpeakerphone(enableSpeakerphone.value);
    // await _engine.enableLocalAudio(false);
  }

  Future<void> _joinChannel() async {
    if (Platform.isAndroid) {
      await Permission.microphone.request();
    }
    await _engine
        .joinChannel(
            token: token,
            channelId: call.channelId ?? '',
            uid: call.getId() ?? 0,
            options: const ChannelMediaOptions(
              channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
              clientRoleType: ClientRoleType.clientRoleBroadcaster,
            ))
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
    await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
    }).catchError((err) {
      printError(info: 'enableLocalAudio $err');
    });
  }

  void switchSpeakerphone() {
    _engine.setEnableSpeakerphone(!enableSpeakerphone.value).then((value) {
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
        AppDataGlobal.androidDeviceInfo!.version.sdkInt >= 28) {
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
      _uiRepository.sendCallNotification(
        invoiceId: call.invoiceId,
        callId: call.id,
        callIsVideo: call.isVideo,
        callerName: call.callerName,
        callerPic: call.callerPic,
      );
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
    if (isChangeCall) {
      return;
    }
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
