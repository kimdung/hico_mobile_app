import 'package:get/get.dart';
import 'package:ui_api/models/notifications/notification_model.dart';

import '../../../base/base_controller.dart';

class NotificationDetailController extends BaseController {
  late NotificationModel? notification;

  NotificationDetailController() {
    notification = Get.arguments as NotificationModel?;
  }

  // @override
  // Future<void> onInit() {
  //   final int? id = Get.arguments;
  //   _loadData(id);
  //   return super.onInit();
  // }

  // Future<void> _loadData(int? id) async {
  //   try {
  //     await EasyLoading.show();
  //     await _uiRepository.notificationDetail(id!).then((response) {
  //       EasyLoading.dismiss();
  //       if (response.status == CommonConstants.statusOk &&
  //           response.detail != null) {
  //         notification.value = response.detail!.detail!;
  //       }
  //     });
  //   } catch (e) {
  //     await EasyLoading.dismiss();
  //     await DialogUtil.showPopup(
  //       dialogSize: DialogSize.Popup,
  //       barrierDismissible: false,
  //       backgroundColor: Colors.transparent,
  //       child: NormalWidget(
  //         icon: IconConstants.icFail,
  //         title: 'error_mess'.tr,
  //       ),
  //       onVaLue: (value) {
  //         Get.back();
  //       },
  //     );
  //     return;
  //   }
  // }
}
