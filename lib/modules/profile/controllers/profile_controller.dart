import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_api/models/master_data/bank_model.dart';
import 'package:ui_api/models/user/address_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/user/update_info_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/data_general/banks.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widgets/image_widget/image_widget.dart';
import '../../../shared/widgets/showbottom_sheet/show_bottom_sheet.dart';

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
  //final TextEditingController bankName = TextEditingController();
  final TextEditingController bankBranchName = TextEditingController();
  final TextEditingController bankAccountHolder = TextEditingController();
  final TextEditingController bankAccountNumber = TextEditingController();

  final TextEditingController zipCode = TextEditingController();
  final TextEditingController province = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController address = TextEditingController();

  Rx<int> showSuggest = Rx<int>(0);
  RxList<AddressModel> addressList = RxList<AddressModel>();
  int addressId = 0;

  Rx<String> bankName = Rx('');
  int? bankId;
  List<BankLocalModel> lstBanks = [];

  ProfileController() {
    _loadData();
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

  Future<void> loadAddress(String keyword) async {
    try {
      province.text = '';
      district.text = '';
      if (keyword != '') {
        await _uiRepository.addressList(20, 0, keyword).then((response) {
          if (response.status == CommonConstants.statusOk &&
              response.data != null &&
              response.data!.rows != null &&
              response.data!.rows!.isNotEmpty) {
            addressList.value = response.data!.rows!;
            showSuggest.value = 1;
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void closeSuggest() {
    showSuggest.value = 0;
  }

  Future<void> selectAddress(AddressModel item) async {
    try {
      zipCode.text = item.code!;
      province.text = item.provinceName!;
      district.text = item.districtName!;
      addressId = item.id!;
      showSuggest.value = 0;
      address.text = item.address!;
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
    bankId = info.value.bankId;
    bankName.value = info.value.bankName ?? '';
    bankBranchName.text = info.value.bankBranchName ?? '';
    bankAccountHolder.text = info.value.bankAccountHolder ?? '';
    bankAccountNumber.text = info.value.bankAccountNumber ?? '';
    addressId = info.value.address != null ? info.value.address!.id! : 0;
    zipCode.text =
        info.value.address != null ? info.value.address!.code ?? '' : '';
    province.text = info.value.address != null
        ? info.value.address!.provinceName ?? ''
        : '';
    district.text = info.value.address != null
        ? info.value.address!.districtName ?? ''
        : '';
    address.text =
        info.value.address != null ? info.value.address!.address ?? '' : '';
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
       minTime: DateTime(1950, 1, 1),
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
          bankId: bankId,
          bankBranchName: bankBranchName.text,
          bankAccountHolder: bankAccountHolder.text,
          bankAccountNumber: bankAccountNumber.text,
          addressId: addressId,
          address: address.text,
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
