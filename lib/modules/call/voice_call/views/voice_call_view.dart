import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../controllers/voice_call_controller.dart';

class VoiceCallView extends GetView<VoiceCallController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    controller.dutationCall.value == 0 ? 'calling'.tr : '',
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: AppColor.sixTextColorLight,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(70)),
                  child: CachedNetworkImage(
                    width: 140,
                    height: 140,
                    imageUrl: controller.call.getImage() ?? '',
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
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  controller.call.getName() ?? '',
                  style: TextAppStyle().normalTextStype().copyWith(
                        fontSize: 18,
                      ),
                ),
                Obx(
                  () => Text(
                    controller.dutationCall.value > 0
                        ? controller.formatTime(controller.dutationCall.value)
                        : '',
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: AppColor.sixTextColorLight,
                        ),
                  ),
                ),
              ],
            ),
          ),
          _buildVoiceCallFunction(),
        ],
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
              onPressed: controller.switchSpeakerphone,
              child: Icon(
                controller.enableSpeakerphone.value
                    ? Icons.volume_off
                    : Icons.volume_up,
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
              onPressed: controller.switchMicrophone,
              child: Icon(
                controller.openMicrophone.value
                    ? Icons.mic_none
                    : Icons.mic_off_outlined,
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
