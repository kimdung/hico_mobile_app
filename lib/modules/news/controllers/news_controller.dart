import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class NewsController extends BaseController {
  // ignore: type_annotate_public_apis
  var scrollController = ScrollController();
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<NewsModel> newsList = RxList<NewsModel>();
  int limit = CommonConstants.limit;
  int offset = 0;

  NewsController() {
    //loadNewsList();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          _loadMore();
        }
      }
    });
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadNewsList() async {
    try {
      await EasyLoading.show();
      offset = 0;
      await _uiRepository.newsList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.newsListModel != null &&
            response.newsListModel!.rows != null) {
          if (response.newsListModel!.rows!.isNotEmpty) {
            offset = response.newsListModel!.rows!.length;
            newsList.value = response.newsListModel!.rows!;
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore() async {
    try {
      await EasyLoading.show();
      await _uiRepository.newsList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.newsListModel != null &&
            response.newsListModel!.rows != null) {
          if (response.newsListModel!.rows!.isNotEmpty) {
            offset += response.newsListModel!.rows!.length;
            newsList.addAll(response.newsListModel!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> viewDetail(int id) async {
    await Get.toNamed(Routes.NEWS_DETAIL, arguments: id);
  }

  @override
  void onClose() {}
}
