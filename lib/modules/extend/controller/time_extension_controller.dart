import 'dart:developer';

import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../extend_model.dart';

class TimeExtensionController extends BaseController {
  final extendList = List<ExtendModel>.from(dataExtendList);
  int preIndex = 0;
  ExtendModel? model;

  @override
  Future<void> onInit() {
    extendList.forEach((element) {
      log('${element.timeExtend} minute - ${element.money} JPY');
    });
    return super.onInit();
  }

  void onChooseItemExtend(int currentIndex) {
    extendList[currentIndex].isChoose = true;
    extendList[preIndex].isChoose = !extendList[currentIndex].isChoose;
    preIndex = currentIndex;
    model = extendList[currentIndex];
    log('Value: ${extendList[currentIndex].isChoose}');
    update();
  }

  void onHandleExtendButton() {
    log('Message: ${model!.timeExtend} - ${model!.money}');
    Get.toNamed(Routes.BOOKING_DETAIL, arguments: model);
  }
}
