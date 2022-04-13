import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:ui_api/models/call/call_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/methods/call_methods.dart';
import '../../../shared/styles/text_style/text_style.dart';

class PickupView extends StatelessWidget {
  final CallModel call;
  final CallMethods callMethods = CallMethods();

  PickupView({required this.call});

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
            imageUrl: call.getImage() ?? '',
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
          call.getName() ?? '',
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
              (call.isVideo ?? false) ? Icons.videocam : Icons.call,
              size: 25,
              color: AppColor.primaryBackgroundColorLight,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAcceptCall() async {
    if (call.channelId == null) {
      await callMethods.endCall(call: call);
      return;
    }
    final _uiRepository = Get.find<HicoUIRepository>();
    try {
      await EasyLoading.show();
      await _uiRepository.getCallToken(call.channelId!).then((response) {
        EasyLoading.dismiss();

        if (response.status == CommonConstants.statusOk &&
            response.data?.token != null) {
          if (call.isVideo ?? false) {
            Get.toNamed(Routes.VIDEO_CALL, arguments: {
              CommonConstants.IS_CALLER: false,
              CommonConstants.CALL_MODEL: call,
              CommonConstants.CALL_TOKEN: response.data!.token!,
            });
          } else {
            Get.toNamed(Routes.VOICE_CALL, arguments: {
              CommonConstants.IS_CALLER: false,
              CommonConstants.CALL_MODEL: call,
              CommonConstants.CALL_TOKEN: response.data!.token!,
            });
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onDeniedCall() async {
    await callMethods.endCall(call: call);
  }
}
