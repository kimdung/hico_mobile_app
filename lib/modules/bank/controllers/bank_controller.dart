import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/shared/widget_hico/data_general/banks.dart';
import 'package:hico/shared/widgets/showbottom_sheet/show_bottom_sheet.dart';
import 'package:ui_api/models/master_data/bank_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/user/update_bank_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';

class BankController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final formBank = GlobalKey<FormState>();

  //final TextEditingController bankName = TextEditingController();
  final TextEditingController bankBranchName = TextEditingController();
  final TextEditingController bankAccountHolder = TextEditingController();
  final TextEditingController bankAccountNumber = TextEditingController();
  String code = '';

  Rx<String> bankName = Rx('');
  int? bankId;
  List<BankLocalModel> lstBanks = [];
  BankController() {}

  @override
  Future<void> onInit() {
    return super.onInit();
  }

  Future _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository.getInfo().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.info != null) {
          AppDataGlobal.userInfo = response.data!.info!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> getBank(BuildContext context) async {
    try {
      await EasyLoading.show();
      await _uiRepository.banks().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          lstBanks = response.data!.rows!;
          return;
        }
      });
      await ShowBottomSheet().showBottomSheet(
        child: Container(
          height: Get.height / 2,
          child: BanksWidget(
            banks: lstBanks,
            currentId: bankId,
          ),
        ),
        context: context,
        onValue: (_value) {
          if (_value != null && _value is BankLocalModel) {
            bankId = _value.id;
            bankName.value = _value.name ?? '';
          }
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future updated() async {
    try {
      if (formBank.currentState?.validate() ?? false) {
        await EasyLoading.show();
        await _uiRepository
            .updateBank(UpdateBankRequest(
          bankId: bankId,
          bankBranchName: bankBranchName.text,
          bankAccountHolder: bankAccountHolder.text,
          bankAccountNumber: bankAccountNumber.text,
        ))
            .then((response) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: response.status == CommonConstants.statusOk
                  ? IconConstants.icSuccess
                  : IconConstants.icFail,
              title: response.message,
            ),
            onVaLue: (value) {
              if (response.status == CommonConstants.statusOk) {
                _loadData();
                Get.back();
              }
            },
          );
          return;
        }).catchError(
          (onError) {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: const NormalWidget(
                icon: IconConstants.icFail,
                title: 'There was an error processing, please try again!',
              ),
              onVaLue: (value) {},
            );
          },
        );
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> next() async {
    await Get.toNamed(Routes.SERVICE);
  }

  @override
  void onClose() {}
}
