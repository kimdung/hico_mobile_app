import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:hico/shared/widget_hico/data_general/date_picker.dart';
import 'package:hico/shared/widget_hico/dialog/time_spiner_widget.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:ui_api/request/supplier/supplier_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget_hico/data_general/district.dart';
import '../../../shared/widget_hico/data_general/level.dart';
import '../../../shared/widget_hico/data_general/province.dart';
import '../../../shared/widget_hico/data_general/rating.dart';
import '../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../shared/widgets/showbottom_sheet/show_bottom_sheet.dart';

class SupplierFilterController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  SupplierRequest request = SupplierRequest();
  BookingPrepareRequest bookingPrepare = BookingPrepareRequest();

  DateTime fromDate = DateTime.now();
  DateTime tmpFromTime = DateTime.now();
  DateTime tmpToTime = DateTime.now();

  final TextEditingController date = TextEditingController();
  Rx<String> fromTime = Rx('');
  Rx<String> toTime = Rx('');
  Rx<String> province = Rx('');
  Rx<String> district = Rx('');
  Rx<String> level = Rx('${'supplier.filter.level_title'.tr}: ${'all'.tr}');
  Rx<int> star = Rx(0);
  Rx<int> isOnline = Rx(CommonConstants.online);
  List<DistrictsModel> lstDistrict = [];

  SupplierFilterController() {
    bookingPrepare = Get.arguments;
    request.serviceId = bookingPrepare.service?.id;
    date.value = TextEditingValue(text: DateFormatter.formatDate(fromDate));
    request.filterIsOnline = isOnline.value;
    request.filterLevelId = 0;
    
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> selectFromDate(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 1.2,
        child: DatePickerWidget(
          currentDate: fromDate,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is DateTime) {
          fromDate = _value;
          date.value = TextEditingValue(text: DateFormatter.formatDate(_value));
        }
      },
    );

    // final picked = await showDatePicker(
    //     context: context,
    //     initialDate: fromDate,
    //     firstDate: DateTime(1901, 1),
    //     lastDate: DateTime(2100));
    // if (picked != null && picked != fromDate) {
    //   fromDate = picked;
    //   date.value = TextEditingValue(text: DateFormatter.formatDate(picked));
    // }
  }

  Future<void> showTimeFrom(BuildContext context) async {
    await DialogUtil.showPopup(
      dialogSize: DialogSize.Popup,
      barrierDismissible: true,
      height: 300,
      backgroundColor: AppColor.primaryBackgroundColorLight,
      child: TimeSpinerWidget(
        currentTime: tmpFromTime,
      ),
      onVaLue: (_value) {
        if (_value != null && _value is DateTime) {
          tmpFromTime = _value;
          fromTime.value = DateFormatter.formatTime(_value);
        }
      },
    );
  }

  Future<void> showTimeTo(BuildContext context) async {
    await DialogUtil.showPopup(
      dialogSize: DialogSize.Popup,
      barrierDismissible: true,
      height: 300,
      backgroundColor: AppColor.primaryBackgroundColorLight,
      child: TimeSpinerWidget(
        currentTime: tmpToTime,
      ),
      onVaLue: (_value) {
        if (_value != null && _value is DateTime) {
          tmpToTime = _value;
          toTime.value = DateFormatter.formatTime(_value);
        }
      },
    );
  }

  Future<void> getProvince(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 2,
        child: ProvinceWidget(
          provinces: AppDataGlobal.masterData!.provinces!,
          currentID: request.filterLocationProvinceId,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is ProvincesModel) {
          request.filterLocationProvinceId = _value.id;
          province.value = _value.name ?? '';
          district.value = '';
        }
      },
    );
  }

  Future<void> getDistricts(BuildContext context) async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .getDistrict(request.filterLocationProvinceId ?? 0)
          .then((response) {
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
            currentId: request.filterLocationDistrictId,
          ),
        ),
        context: context,
        onValue: (_value) {
          if (_value != null && _value is DistrictsModel) {
            request.filterLocationDistrictId = _value.id;
            district.value = _value.name ?? '';
          }
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> getLevel(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 2,
        child: LevelWidget(
          levels: AppDataGlobal.masterData!.levels!,
          //AppDataGlobal.masterData!.levels!
          currentLevel: request.filterLevelId,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is LevelModel) {
          request.filterLevelId = _value.id;
          level.value = _value.name != null
              ? '${'supplier.filter.level_title'.tr}: ${_value.name!}'
              : '';
        }
      },
    );
  }

  Future<void> getRating(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 1.8,
        child: RatingsWidget(
          currentStar: request.filterNumberStar,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is double) {
          if (_value.toInt() == 0 ||
              _value.toInt() == request.filterNumberStar) {
            request.filterNumberStar = null;
            star.value = 0;
          } else {
            request.filterNumberStar = _value.toInt();
            star.value = _value.toInt();
          }
        }
      },
    );
  }

  Future<void> selectRadio(int value) async {
    isOnline.value = value;
    request.filterIsOnline = value;
  }

  Future<void> search() async {
    request.filterDate = date.text;
    request.filterTimeSlot = '$fromTime - $toTime';
    request.limit = 20;
    request.offset = 0;
    bookingPrepare.supplierRequest = request;
    log('Log: ${bookingPrepare.supplierRequest.toString()}');

    var hours = tmpToTime.difference(tmpFromTime).inHours.toDouble();
    final minutes = tmpToTime.difference(tmpFromTime).inMinutes;
    final tmpMinutes = minutes - (hours * 60);
    if (tmpMinutes > 0 && tmpMinutes <= 30) {
      hours += 0.5;
    } else if (tmpMinutes > 30) {
      hours += 1;
    }
    bookingPrepare.totalTime = hours;

    var validater = false;
    var message = '';

    if (request.filterLocationProvinceId == null || request.filterLocationDistrictId == null) {
      validater = true;
      message = 'supplier.filter.location_required'.tr;
    } 
    
    if (fromTime.value == '' || toTime.value == '') {
      validater = true;
      message = 'supplier.filter.time_required'.tr;
    } 
 
    if (validater) {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: message,
        ),
        onVaLue: (value) {},
      );
      return;
    } else {
      await Get.toNamed(Routes.SUPPLIERS, arguments: bookingPrepare);
    }
  }

  @override
  void onClose() {}
}
