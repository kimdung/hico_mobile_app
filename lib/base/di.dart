import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_api/datasource/remote/hico_ui_api.dart';
import 'package:ui_api/network/dio_client.dart';
import 'package:ui_api/network/interceptor/logger_interceptor.dart';
import 'package:ui_api/network/interceptor/token_interceptor.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/repository/impl/hico_ui_repository_impl.dart';

import '../data/app_data_global.dart';
import '../data/hive_database/dao/image_cache_dao.dart';
import '../data/hive_database/hive_database.dart';
import '../routes/app_pages.dart';
import '../shared/constants/common.dart';
import '../shared/services/config_service.dart';
import '../shared/services/locator_service.dart';
import '../shared/services/storage_service.dart';

class DependencyInjection {
  static Future<void> init(String environment) async {
    HttpOverrides.global = MyHttpOverrides();

    final config = await ConfigService().init(environment);
    Get.put(() => config);
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => LocateService().init());

    await LineSDK.instance.setup(config.value[LineChannelId]!);

    try {
      AppDataGlobal.androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    } catch (e) {
      //
    }

    try {
      Stripe.publishableKey = config.value[StripePublishableKey]!;
      await Stripe.instance.applySettings();
    } catch (e) {
      debugPrint('init Stripe error ${e.toString()}');
    }

    final _dioUIAPI =
        await DioClient.setup(baseUrl: config.value[UIAPIDomain]!);

    _dioUIAPI.interceptors.add(TokenInterceptor(
      errorUnauthorized: () {
        Get.offAndToNamed(Routes.ONBOARDING, arguments: 'error.expires'.tr);
      },
    ));

    if (kDebugMode) {
      _dioUIAPI.interceptors.add(LoggerInterceptor(
        ignoreReponseDataLog: (p0) => false,
      ));
    }
    final uiAPI = HicoUIAPI(_dioUIAPI);
    final HicoUIRepository uiRepo = HicoUIRepositoryImpl(uiAPI);
    Get.put(uiRepo, permanent: true);

    //For cahe Image
    final dir = await getApplicationDocumentsDirectory();
    final _hive = HiveDatabase(dir.path);
    await _hive.init();
    Get.put(ImageCacheDAO(_hive.imageCacheBox), permanent: true);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
