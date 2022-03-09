import 'dart:io';

import 'package:data_infrastructure/data_infrastructure.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hico/shared/widget_hico/data_general/date_picker.dart';
import 'package:hico/shared/widgets/showbottom_sheet/show_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/user/avatar_request.dart';
import 'package:ui_api/request/user/update_info_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widgets/image_widget/image_widget.dart';

class ProfileController extends BaseController {
  Rx<UserInfoModel> info = Rx(UserInfoModel());
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<int> genderId = Rx(CommonConstants.male);
  Rx<String> birthDay = Rx('');
  final imageWidget = ImageWidgetController();
  final formProfile = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController bankBranchName = TextEditingController();
  final TextEditingController bankAccountHolder = TextEditingController();
  final TextEditingController bankAccountNumber = TextEditingController();

  ProfileController() {
    _loadData();
  }

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
          info.value = response.data!.info!;
          AppDataGlobal.userInfo = response.data!.info!;
          _prepareData();
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future _prepareData() async {
    name.text = info.value.name ?? '';
    genderId.value = info.value.gender ?? CommonConstants.male;
    email.text = info.value.email ?? '';
    birthDay.value = info.value.dateOfBirth ?? '';
    phone.text = info.value.phoneNumber ?? '';
    bankName.text = info.value.bankName ?? '';
    bankBranchName.text = info.value.bankBranchName ?? '';
    bankAccountHolder.text = info.value.bankAccountHolder ?? '';
    bankAccountNumber.text = info.value.bankAccountNumber ?? '';
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      //call api
      await updateAvatar(imageTemporary);
      //this.images.value = imageTemporary;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future updateAvatar(File image) async {
    try {
      await EasyLoading.show();
      await _uiRepository.updateAvatar(image).then((response) {
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
              info.value = response.data!.info!;
              AppDataGlobal.userInfo = info.value;
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
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future selectGender(int value) async {
    genderId.value = value;
  }

  Future<void> showDate(BuildContext context) async {
    await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        birthDay.value = DateFormatter.formatDate(date);
      },
      currentTime: DateTime.now(),
    );
  }

  Future updateInfo() async {
    try {
      if (formProfile.currentState?.validate() ?? false) {
        await EasyLoading.show();
        await _uiRepository
            .updateInfo(UpdateInfoRequest(
          name: name.text,
          gender: genderId.value,
          dateOfBirth: birthDay.value,
          phoneNumber: phone.text,
          bankName: bankName.text,
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
