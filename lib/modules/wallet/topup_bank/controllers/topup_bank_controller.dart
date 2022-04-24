import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../shared/widgets/image_widget/image_widget.dart';

class TopupBankController extends BaseController {
  final imageWidget = ImageWidgetController();

  final String code;
  final banks = AppDataGlobal.masterData?.banks ?? [];

  final avatar = Rxn<XFile>();

  TopupBankController(this.code);

  /* Action */

  void onCopy(BankModel bank) {
    Clipboard.setData(ClipboardData(text: bank.accountNumber ?? ''));
    EasyLoading.showToast('copied'.tr);
  }

  void onCopyTransferContent() {
    Clipboard.setData(ClipboardData(
      text: 'topup.bank.content'.trArgs([code]),
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

      avatar.value = XFile(image.path);
    } on PlatformException catch (e) {
      printError(info: e.toString());
    }
  }

  void onConfirm() {}
}
