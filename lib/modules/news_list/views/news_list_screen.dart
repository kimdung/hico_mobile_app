import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hico/resource/assets_constant/icon_constants.dart';
import 'package:ui_api/models/news/news_model.dart';

import '../../../data/app_data_global.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/news_list_controller.dart';

part 'news_list_extension.dart';

class NewsListScreen extends GetView<NewsListController> {
  @override
  Widget build(BuildContext context) {
    return AppDataGlobal.accessToken.isNotEmpty
        ? buildPickupLayout(context: context)
        : buildScaffold(context: context);
  }

  Widget buildPickupLayout({required BuildContext context}) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'news.title'.tr,
            style: TextAppStyle()
                .titleAppBarStyle()
                .copyWith(color: AppColor.primaryColorLight),
          ),
          elevation: 4,
          leading: IconButton(
            icon: SvgPicture.asset(
              IconConstants.icBack,
              width: 11,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Obx(() => Container(
              child: controller.newsList.isEmpty
                  ? Center(
                      child: Text(
                        'news.empty'.tr,
                        style: TextAppStyle().normalTextGrey(),
                      ),
                    )
                  : ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.newsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return buildItemNews(item: controller.newsList[index]);
                      }),
            )),
      ),
    );
  }

  Widget buildScaffold({required BuildContext context}) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'news.title'.tr,
          style: TextAppStyle()
              .titleAppBarStyle()
              .copyWith(color: AppColor.primaryColorLight),
        ),
        elevation: 4,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: Obx(() => Container(
            child: controller.newsList.isEmpty
                ? Center(
                    child: Text(
                      'news.empty'.tr,
                      style: TextAppStyle().normalTextGrey(),
                    ),
                  )
                : ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.newsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return buildItemNews(item: controller.newsList[index]);
                    }),
          )),
    );
  }
}
