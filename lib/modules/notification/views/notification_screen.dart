import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/notifications/notification_model.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/notification_controller.dart';

part 'notification_extension.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  final NotificationController controller;
  NotificationScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'notification.title'.tr,
          style: TextAppStyle()
              .titleAppBarStyle()
              .copyWith(color: AppColor.primaryColorLight),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: Obx(() => controller.notificationList.isEmpty
          ? buildEmptyPage()
          : Container(
              child: ListView.builder(
                  itemCount: controller.notificationList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildItemNotification(
                        item: controller.notificationList[index]);
                  }),
            )),
    );
  }
}
