import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../routes/app_pages.dart';

class TopupStripeController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final formState = GlobalKey<FormState>();

  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController bankNumberController = TextEditingController();
  final TextEditingController validDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Action */

  Future<void> onConfirm() async {
    await Get.offAndToNamed(Routes.TOPUP_DETAIL);
  }
}
