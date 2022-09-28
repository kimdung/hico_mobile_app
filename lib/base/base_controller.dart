import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../data/app_data_global.dart';
import '../data/interceptors/listen_error_graphql_interceptor.dart';
import '../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../shared/dialog_manager/services/dialog_service.dart';
import '../shared/methods/call_methods.dart';
import '../shared/network/constants/constants.dart';
import '../shared/network/managers/network_manager.dart';

class BaseController extends FullLifeCycleController
    with NetworkManager, ListenErrorGraphQL, FullLifeCycleMixin {
  final _hasNetworkSubject = BehaviorSubject<bool>();

  Stream<bool> get hasNetworkStream => _hasNetworkSubject.stream;

  Sink<bool> get hasNetworkSink => _hasNetworkSubject.sink;

  // FirebaseMessageConfig firebaseMessageConfig = FirebaseMessageConfig();
  final CallMethods callMethods = CallMethods();

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    await checkConnectNetwork();
  }

  @override
  void onClose() {
    super.onClose();
    _hasNetworkSubject.close();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  Future<void> checkConnectNetwork() async {
    // // Check Network
    // if (!await hasConnectNetwork()) {
    //   hasNetworkSink.add(false);
    //   await callDialogErrorNetwork();
    // } else {
    //   // Has network
    //   hasNetworkSink.add(true);
    // }
  }

  Future<void> callDialogErrorNetwork() async {
    final dialogRequest = CommonDialogRequest(
      title: 'network_error'.tr,
      description: 'network_error_message'.tr,
      defineEvent: NO_CONNECT_NETWORK,
    );
    await doShowDialog(dialogRequest);
  }

  Future<void> doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        await checkConnectNetwork();
        break;
      default:
        break;
    }
  }

  CommonDialogRequest handleErrorResponse(Object e) {
    return handleErrorGraphQLResponse(e);
  }
}
