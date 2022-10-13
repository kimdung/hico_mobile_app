import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/methods/call_methods.dart';
import '../../../shared/styles/text_style/text_style.dart';

class PickupView extends StatefulWidget {
  final CallModel call;

  PickupView({required this.call});

  @override
  State<PickupView> createState() => _PickupViewState();
}

class _PickupViewState extends State<PickupView> {
  final CallMethods callMethods = CallMethods();
  Timer? _timerRingwait;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _startRingtone();
    });
  }

  @override
  void dispose() {
    _endRingtone();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: _buildReceiverInfo()),
          _buildVoiceCallFunction(),
        ],
      ),
    );
  }

  Widget _buildReceiverInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(70)),
          child: CachedNetworkImage(
            width: 140,
            height: 140,
            imageUrl: widget.call.getImage() ?? '',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  width: 1,
                  color: AppColor.primaryHintColorLight,
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          widget.call.getName() ?? '',
          style: TextAppStyle().mediumTextStype().copyWith(
                fontSize: 18,
              ),
        ),
      ],
    );
  }

  Widget _buildVoiceCallFunction() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColor.primaryTextColorLight,
            onPressed: onDeniedCall,
            child: Icon(
              Icons.call_end,
              size: 25,
              color: AppColor.primaryBackgroundColorLight,
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColor.greenColorLight,
            onPressed: onAcceptCall,
            child: Icon(
              (widget.call.isVideo ?? false) ? Icons.videocam : Icons.call,
              size: 25,
              color: AppColor.primaryBackgroundColorLight,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAcceptCall() async {
    _endRingtone();

    if (widget.call.channelId == null) {
      await callMethods.endCall(call: widget.call);
      return;
    }
    final _uiRepository = Get.find<HicoUIRepository>();
    await EasyLoading.show();
    await _uiRepository
        .getCallToken(widget.call.channelId ?? '', widget.call.invoiceId)
        .then((response) {
      EasyLoading.dismiss();
      if (response.status == CommonConstants.statusOk) {
        if (widget.call.isVideo ?? false) {
          Get.toNamed(Routes.VIDEO_CALL, arguments: {
            CommonConstants.IS_CALLER: false,
            CommonConstants.CALL_MODEL: widget.call,
            CommonConstants.CALL_TOKEN: response.data?.token ?? '',
          });
        } else {
          Get.toNamed(Routes.VOICE_CALL, arguments: {
            CommonConstants.IS_CALLER: false,
            CommonConstants.CALL_MODEL: widget.call,
            CommonConstants.CALL_TOKEN: response.data?.token ?? '',
          });
        }
      } else {
        callMethods.endCall(call: widget.call);
      }
    }).catchError((error) {
      printError(info: error.toString());

      EasyLoading.dismiss();

      callMethods.endCall(call: widget.call);
    });
  }

  Future<void> onDeniedCall() async {
    _endRingtone();

    await callMethods.endCall(call: widget.call);
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
}
