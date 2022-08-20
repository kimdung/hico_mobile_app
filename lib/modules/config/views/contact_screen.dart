import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/config_controller.dart';

class ContactScreen extends GetView<ConfigController> {
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
            'contact'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: Column(
            children: [
              buildContactItem(
                  icon: IconConstants.icCtHotline,
                  title: 'Hotline',
                  value: controller.masterData.hotline ?? '',
                  onPress: () {
                    controller.makeAction(
                        'tel', controller.masterData.hotline ?? '');
                  }),
              buildContactItem(
                icon: IconConstants.icCtEmail,
                title: 'Email',
                value: controller.masterData.supportEmail ?? '',
                onPress: () {
                  controller.makeAction(
                      'mailto', controller.masterData.supportEmail ?? '');
                },
              ),
              buildContactItem(
                icon: IconConstants.icCtMessenger,
                title: 'Messenger',
                value: controller.masterData.linkMessenger ?? '',
                onPress: () {
                  controller.makeAction(
                      'https', controller.masterData.linkMessenger ?? '');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContactItem({
    required String icon,
    required String title,
    required String value,
    Function()? onPress,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: AppColor.borderGrayColorLight,
          width: 1,
        ),
      )),
      child: Row(
        children: [
          Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 14),
              child: FCoreImage(
                icon,
                //width: 36,
                fit: BoxFit.cover,
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextAppStyle().normalTextStype(),
              ),
              InkWell(
                onTap: onPress,
                child: Text(
                  value,
                  style: TextAppStyle().genaralTextStyle(),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
