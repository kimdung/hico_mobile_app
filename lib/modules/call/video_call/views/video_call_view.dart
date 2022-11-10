import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/utils/date_formatter.dart';
import '../controllers/video_call_controller.dart';

class VideoCallView extends GetView<VideoCallController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          _buildDuration(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Obx(() {
              return Container(
                margin: const EdgeInsets.only(left: 20, bottom: 140),
                width: Get.width * 0.3,
                height: Get.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black87,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: controller.isJoined.value
                      // ? const RtcLocalView.SurfaceView()
                      ? AgoraVideoView(
                          controller: VideoViewController(
                            rtcEngine: controller.engine!,
                            canvas: const VideoCanvas(uid: 0),
                            useFlutterTexture: false,
                            useAndroidSurfaceView: false,
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildVoiceCallFunction(),
          ),
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    return Obx(() {
      if (controller.remoteUid.value != null) {
        return AgoraVideoView(
          controller: VideoViewController(
            rtcEngine: controller.engine!,
            canvas: VideoCanvas(uid: controller.remoteUid.value!),
            useFlutterTexture: false,
            useAndroidSurfaceView: false,
          ),
        );
        // return RtcRemoteView.SurfaceView(
        //   uid: controller.remoteUid.value!,
        //   channelId: controller.call.channelId ?? '',
        // );
      } else {
        return Text(
          'calling'.tr,
          style: TextAppStyle().normalTextGrey(),
        );
      }
    });
  }

  Widget _buildDuration() {
    return Obx(
      () => controller.remoteUid.value == null
          ? Container()
          : Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  DateFormatter.formatSecondsToTime(
                      controller.dutationCall.value),
                  style: TextAppStyle().titleAppBarStyle().copyWith(
                        color: AppColor.primaryColorLight,
                      ),
                ),
              ),
            ),
    );
  }

  Widget _buildVoiceCallFunction() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 64,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              elevation: 4,
              backgroundColor: AppColor.primaryBackgroundColorLight,
              onPressed: controller.onToggleMute,
              child: Icon(
                controller.muteLocalAudio.value
                    ? Icons.mic_off_outlined
                    : Icons.mic_none,
                size: 25,
                color: AppColor.sixTextColorLight,
              ),
            ),
            FloatingActionButton(
              elevation: 0,
              backgroundColor: AppColor.primaryTextColorLight,
              onPressed: controller.onEndCall,
              child: Icon(
                Icons.call_end,
                size: 25,
                color: AppColor.primaryBackgroundColorLight,
              ),
            ),
            FloatingActionButton(
              elevation: 4,
              backgroundColor: AppColor.primaryBackgroundColorLight,
              onPressed: controller.onSwitchCamera,
              child: Icon(
                Icons.cameraswitch_outlined,
                size: 25,
                color: AppColor.sixTextColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
