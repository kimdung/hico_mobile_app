import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/notification_detail_controller.dart';

class NotificationDetailScreen extends GetView<NotificationDetailController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              IconConstants.icBack,
              width: 11,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'notification.detail_title'.tr,
            style: TextAppStyle()
                .titleAppBarStyle()
                .copyWith(color: AppColor.primaryTextColorLight),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Obx(() => Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.notification.value.displayImage != null &&
                        controller.notification.value.displayImage != '')
                      NetWorkImage(
                        image: controller.notification.value.displayImage!,
                        width: Get.width,
                        height: Get.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        controller.notification.value.title ?? '',
                        style: TextAppStyle().genaralTextStyle().copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(controller.notification.value.createdAt ?? '',
                          style: TextAppStyle()
                              .secondTextStyle()
                              .copyWith(fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 25),
                    if (controller.notification.value.content != null &&
                        controller.notification.value.content != '')
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Html(
                          data: controller.notification.value.content ?? '',
                          style: {
                            'body': Style(
                                fontSize: const FontSize(14.0),
                                fontWeight: FontWeight.w400,
                                color: AppColor.sixTextColorLight),
                          },
                        ),
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
