import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/interceptors/listen_error_graphql_interceptor.dart';
import '../resource/assets_constant/icon_constants.dart';
import '../routes/app_pages.dart';
import '../shared/methods/call_methods.dart';
import '../shared/network/constants/constants.dart';
import '../shared/network/controllers/network_controller.dart';
import '../shared/network/managers/network_manager.dart';
import '../shared/utils/dialog_util.dart';
import '../shared/widget_hico/dialog/normal_widget.dart';

class BaseController extends FullLifeCycleController
    with FullLifeCycleMixin, NetworkManager, ListenErrorGraphQL {
  final _networkController = Get.find<NetworkController>();
  BuildContext? dialogErrorNetworkContext;

  final CallMethods callMethods = CallMethods(); 

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    await checkConnectNetwork();
  }

  @override
  void onDetached() {
    printInfo(
        info:
            'FullLifeCycleMixin onDetached onDetached onDetached onDetached onDetached onDetached');
  }

  @override
  void onInactive() {
    printInfo(
        info:
            'FullLifeCycleMixin onInactive onInactive onInactive onInactive onInactive onInactive');
  }

  @override
  void onPaused() {
    printInfo(
        info:
            'FullLifeCycleMixin onPaused onPaused onPaused onPaused onPaused onPaused onPaused');
  }

  @override
  Future<void> onResumed() async {
    printInfo(
        info:
            'FullLifeCycleMixin onResumed onResumed onResumed onResumed onResumed onResumed onResumed');

    // check network
    await checkConnectNetwork();
  }

  Future<void> checkConnectNetwork() async {
    await _updateConnectNetwork(_networkController.connectionStatus.value);
    _networkController.connectionStatus.listen(_updateConnectNetwork);
  }

  Future _updateConnectNetwork(int status) async {
    if (status == NO_NETWORK) {
      if (Get.currentRoute == Routes.VIDEO_CALL ||
          Get.currentRoute == Routes.VOICE_CALL) {
        Get.back();
      }
      await _callDialogErrorNetwork();
    } else {
      if (dialogErrorNetworkContext != null) {
        Navigator.of(dialogErrorNetworkContext!, rootNavigator: true).pop();
        dialogErrorNetworkContext = null;
      }
    }
  }

  Future<void> _callDialogErrorNetwork() async {
    if (dialogErrorNetworkContext == null) {
      dialogErrorNetworkContext = Get.context!;

      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'notify.network.error'.tr,
        ),
        onVaLue: (value) async {
          dialogErrorNetworkContext = null;
          final status = await _networkController.checkConnectivity();
          await _updateConnectNetwork(status);
        },
      );
    }
  }
}
