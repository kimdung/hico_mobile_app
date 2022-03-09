import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/config_controller.dart';

class ContactScreen extends GetView<ConfigController> {
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
              value: '1900800988',
            ),
            buildContactItem(
              icon: IconConstants.icCtEmail,
              title: 'Email',
              value: 'hicosupport@hico.com',
            ),
            buildContactItem(
              icon: IconConstants.icCtMessenger,
              title: 'Messenger',
              value: 'https://www.facebook.com/messages/hico',
            )
          ],
        ),
      ),
    );
  }

  Container buildContactItem(
      {required String icon, required String title, required String value}) {
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
              Text(value, style: TextAppStyle().genaralTextStyle()),
            ],
          ))
        ],
      ),
    );
  }
}
