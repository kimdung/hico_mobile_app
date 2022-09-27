import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/news/news_model.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../controllers/news_controller.dart';

part 'news_extension.dart';

class NewsScreen extends GetView<NewsController> {
  @override
  final NewsController controller;
  NewsScreen(this.controller);
  @override
  Widget build(BuildContext context) {
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
