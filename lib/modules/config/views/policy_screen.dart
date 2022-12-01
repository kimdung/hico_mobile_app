import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../controllers/config_controller.dart';

class PolicyScreen extends GetView<ConfigController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: Get.back,
        ),
        title: Text(
          'privacy_policy'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Html(
                  data: AppDataGlobal.masterData!.privacyPolicy,
                  style: {
                    'body': Style(
                        fontSize: FontSize(14.0),
                        fontWeight: FontWeight.w400,
                        color: AppColor.sixTextColorLight),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
