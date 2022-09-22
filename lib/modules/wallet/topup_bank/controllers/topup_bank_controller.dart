import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/shared/utils/dialog_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/wallet/topup_history_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../../shared/widgets/image_widget/image_widget.dart';

class TopupBankController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final imageWidget = ImageWidgetController();
  final noteController = TextEditingController();

  late TopupHistoryModel topup;
  final banks = AppDataGlobal.masterData?.banks ?? [];

  final imageBill = Rxn<File>();
  bool isOrder = false;

  TopupBankController() {
    final arguments = Get.arguments as Map;
    isOrder = arguments[CommonConstants.TOPUP_ISORDER];
    topup = arguments[CommonConstants.TOPUP_DATA];
  }

  /* Action */

  Future<void> onCopy(BankModel bank) async {
    await Clipboard.setData(ClipboardData(text: bank.accountNumber ?? ''));
    await DialogUtil.showMenu();
  }

  void onCopyTransferContent() {
    Clipboard.setData(ClipboardData(
      text: 'topup.bank.content'.trArgs([topup.code ?? '']),
    ));
    EasyLoading.showToast('copied'.tr);
  }

  Future onSelectImageBill() async {
    try {
      final source = await imageWidget.showImageSource(Get.context!);
      if (source == null) {
        return;
      }

      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }

      imageBill.value = File(image.path);
    } on PlatformException catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> onConfirm() async {
    FocusScope.of(Get.context!).unfocus();

    if (imageBill.value == null) {
      await EasyLoading.showToast('topup.image.bill.valid'.tr);
      return;
    }

    try {
      await EasyLoading.show();
      await _uiRepository
          .topupBankConfirm(
              imageBill.value!, topup.code ?? '', noteController.text)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.row != null) {
          if (isOrder) {
            Get.back(result: isOrder);
          } else {
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: IconConstants.icSuccess,
                title: response.message ?? 'topup.success'.tr,
              ),
              onVaLue: (value) {
                Get.offAndToNamed(Routes.TOPUP_DETAIL,
                    arguments: response.data!.row);
              },
            );
          }
        } else {
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: response.message ?? 'topup.failure'.tr,
            ),
            onVaLue: (value) {},
          );
        }
      });
    } catch (e) {
      printError(info: 'Nạp tiền thất bại ${e.toString()}');
      await EasyLoading.dismiss();
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'topup.failure'.tr,
        ),
        onVaLue: (value) {},
      );
    }
  }
}
