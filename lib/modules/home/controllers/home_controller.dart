import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/modules/main/controllers/main_controller.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class HomeController extends BaseController {
  final Rx<int> currentStatus = Rx(0);
  final Rx<int> totalNotif = Rx(2);
  final Rx<int> bottomIndex = Rx(0);
  final _uiRepository = Get.find<HicoUIRepository>();
  final homeModel = Rx(HomeModel());
  BookingPrepareRequest request = BookingPrepareRequest();

  //final mainController = MainController();

  HomeController() {
    //onInit();
    loadData();
  }

  @override
  Future<void> onInit() async {
    await loadData();
    await super.onInit();
  }

  Future<void> loadData() async {
    try {
      //await EasyLoading.show();
      await _uiRepository.home().then((response) {
        //EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.homeModel != null) {
          homeModel.value = response.homeModel!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> viewDetail(int id) async {
    await Get.toNamed(Routes.SERVICE, arguments: id);
  }

  Future<void> viewService(ServiceModel item) async {
    request.service = item;
    await _uiRepository.serviceView(item.id!).then((response) {});
    await Get.toNamed(Routes.SUPPLIER_FILTER, arguments: request);
  }

  Future<void> viewAllNews() async {
    await Get.toNamed(Routes.NEWS_LIST);
  }

  Future<void> viewNews(int id) async {
    await Get.toNamed(Routes.NEWS_DETAIL, arguments: id);
  }

  Future<void> actContinue(int id) async {
    await _uiRepository.serviceView(id).then((response) {});
    await Get.toNamed(Routes.SUPPLIER_FILTER, arguments: id);
  }

  Future<void> registerConsulting() async {
    await Get.toNamed(Routes.CONSULTING);
  }

  Future<void> onChatAdmin() async {
    if (AppDataGlobal.client == null) {
      return;
    }
    final channel = AppDataGlobal.client!.channel('messaging',
        id: AppDataGlobal.userInfo?.conversationInfo?.getAdminChannel() ?? '');

    final _usersResponse = await AppDataGlobal.client?.queryUsers(
      filter: Filter.autoComplete(
          'id', AppDataGlobal.userInfo?.conversationInfo?.adminId ?? ''),
    );

    await Get.toNamed(Routes.CHAT, arguments: {
      CommonConstants.CHANNEL: channel,
      CommonConstants.CHAT_USER: (_usersResponse?.users.isEmpty ?? true)
          ? AppDataGlobal.userInfo?.conversationInfo?.getAdmin()
          : _usersResponse!.users.first,
    });
  }
}
