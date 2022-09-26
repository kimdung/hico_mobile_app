import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/data_general/district.dart';
import '../../../shared/widget_hico/data_general/province.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widgets/showbottom_sheet/show_bottom_sheet.dart';

class ConsultingController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  final consultingForm = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController service = TextEditingController();
  final TextEditingController contents = TextEditingController();

  Rx<String> province = Rx('');
  Rx<String> district = Rx('');
  int? provinceId;
  int? districtId;
  List<DistrictsModel> lstDistrict = [];

  @override
  Future<void> onInit() async {
    return super.onInit();
  }

  Future<void> getProvince(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 2,
        child: ProvinceWidget(
          provinces: AppDataGlobal.masterData!.provinces!,
          currentID: provinceId,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is ProvincesModel) {
          provinceId = _value.id;
          province.value = _value.name ?? '';
          district.value = '';
        }
      },
    );
  }

  Future<void> getDistricts(BuildContext context) async {
    try {
      await EasyLoading.show();
      await _uiRepository.getDistrict(provinceId ?? 0).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.districts != null) {
          lstDistrict = response.districts!;
          return;
        }
      });
      await ShowBottomSheet().showBottomSheet(
        child: Container(
          height: Get.height / 2,
          child: DistrictWidget(
            district: lstDistrict,
            currentId: districtId,
          ),
        ),
        context: context,
        onValue: (_value) {
          if (_value != null && _value is DistrictsModel) {
            districtId = _value.id;
            district.value = _value.name ?? '';
          }
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> send() async {
    try {
      if (consultingForm.currentState?.validate() ?? false) {
        if (provinceId == null || districtId == null) {
          await DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: 'consulting.address'.tr,
            ),
            onVaLue: (value) {},
          );
          return;
        }

        await EasyLoading.show();
        await _uiRepository
            .consulting(
          name.text,
          email.text,
          phone.text,
          provinceId!,
          districtId!,
          7,
          contents.text,
        )
            .then((response) {
          if (response.status == CommonConstants.statusOk) {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: IconConstants.icOrderCode,
                titleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'consulting.success'.tr,
                      style: TextAppStyle().normalTextPink(),
                    ),
                    Text(
                      response.message!,
                      textAlign: TextAlign.center,
                      style: TextAppStyle().normalTextStype(),
                    ),
                  ],
                ),
              ),
              onVaLue: (value) {
                Get.back();
              },
            );
            return;
          } else {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: response.status == CommonConstants.statusOk
                    ? IconConstants.icOrderCode
                    : IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {},
            );
            return;
          }
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

  @override
  void onClose() {}
}
