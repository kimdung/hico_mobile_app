import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import 'app.dart';
import 'base/di.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DependencyInjection.init(PROD_ENVIRONMENT);
  await LineSDK.instance.setup('1656878196');
  
  runApp(App());
  configLoading();
}
