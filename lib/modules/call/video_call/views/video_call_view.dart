import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
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
          Align(
              alignment: Alignment.topRight,
              child: Obx(() {
                if (controller.isJoined.value) {
                  return Container(
                    margin: const EdgeInsets.only(top: 30, right: 30),
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const RtcLocalView.SurfaceView(),
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: 30, right: 30),
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.black87,
                        alignment: Alignment.center,
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  );
                }
              })),
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    return Obx(() {
      if (controller.remoteUid.value != null) {
        return RtcRemoteView.SurfaceView(
          uid: controller.remoteUid.value!,
          channelId: controller.call.channelId ?? '',
        );
      } else {
        return Text(
          'calling'.tr,
          style: TextAppStyle().genaralTextStyle().copyWith(
                color: AppColor.sixTextColorLight,
              ),
        );
      }
    });
  }
}
