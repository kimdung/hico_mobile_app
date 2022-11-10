import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/news_detail_controller.dart';

class NewsDetailScreen extends GetView<NewsDetailController> {
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
            'news.detail_title'.tr,
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
                    if (controller.news.value.displayImage != null)
                      NetWorkImage(
                        image: controller.news.value.displayImage!,
                        width: Get.width,
                        height: Get.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        controller.news.value.title ?? '',
                        style: TextAppStyle().largeTextStype(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        controller.news.value.createdAt ?? '',
                        style: TextAppStyle().smallTextGrey(),
                      ),
                    ),
                    if (controller.news.value.content != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Html(
                          data: controller.news.value.content,
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
              )),
        ),
      ),
    );
  }
}
