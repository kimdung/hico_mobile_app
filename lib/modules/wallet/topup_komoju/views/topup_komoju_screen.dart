import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../call/pickup/picker_layout.dart';
import '../controllers/topup_komoju_controller.dart';

class TopupKomojuScreen extends GetView<TopupKomojuController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: SvgPicture.asset(IconConstants.icBack, width: 11),
              onPressed: Get.back,
            ),
            title: Text(
              'topup.komoju'.tr,
              style: TextAppStyle().titleAppBarStyle(),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
          ),
          body: WebView(
            initialUrl: controller.payUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller.webViewController.complete(webViewController);
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) =>
                controller.navigationDelegate(request),
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
