import 'package:flutter/material.dart';

import 'app.dart';
import 'base/di.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init(PROD_ENVIRONMENT);

  runApp(App());
  configLoading();
}
