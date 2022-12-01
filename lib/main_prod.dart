import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';

import 'app.dart';
import 'base/di.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // for IOS.
    ),
  );
  try {
    await Firebase.initializeApp();
  } catch (e) {
    Get.log(e.toString(), isError: true);
  }
  await DependencyInjection.init(PROD_ENVIRONMENT);
  runApp(App());
  configLoading();
}
