import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../../../../base/base_controller.dart';
import '../../../../routes/app_pages.dart';

class WalletController extends BaseController {
  Rx<int> indexPage = Rx(0);

  StreamSubscription? _streamSubscription;

  @override
  Future<void> onInit() async {
    await super.onInit();

    printInfo(info: 'init listner Komaju');
    _streamSubscription = linkStream.listen((String? link) {
      // if (!this.mounted) {
      //   return;
      // }
      printInfo(info: 'payment Komaju 111 ${link ?? 'null'}');
      if (Get.routing.current != Routes.WALLET || link == null) {
        return;
      }
      final uri = Uri.parse(link);
      // var resultCode = uri.queryParameters["resultCode"];
      printInfo(info: 'payment Komaju ${uri.toString()}');
      // if (resultCode == "0") {
      //   Navigator.of(context)
      //       .pushNamed(PaymentSuccessScreen.routeName, arguments: paymentData);
      // } else {
      //   var message = uri.queryParameters["message"] ?? "";
      //   DialogUtil.createDialogMessage(context: context, title: message);
      // }
    }, onError: (err) {
      if (Get.routing.current != Routes.WALLET) {
        return;
      }
      printError(info: 'Failed to get latest link: $err.');
    });

    await initUniLinks();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    printInfo(info: 'onClose onClose onClose onClose onClose ');
    super.onClose();
  }

  Future initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      printInfo(info: 'getInitialLink Komaju ${initialLink.toString()}');
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }
}
