import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:ui_api/request/invoice/booking_request.dart';
import 'package:ui_api/request/supplier/supplier_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/date_formatter.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget_hico/data_general/date_picker.dart';
import '../../../../shared/widget_hico/data_general/district.dart';
import '../../../../shared/widget_hico/data_general/province.dart';
import '../../../../shared/widget_hico/data_general/service.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../../shared/widget_hico/dialog/time_spiner_widget.dart';
import '../../../../shared/widgets/showbottom_sheet/show_bottom_sheet.dart';

class BookingSupplierBookingController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();

  BookingRequest bookingRequest = BookingRequest();

  SupplierRequest request = SupplierRequest();
  BookingPrepareRequest bookingPrepare = BookingPrepareRequest();

  DateTime fromDate = DateTime.now();
  DateTime tmpFromTime = DateTime.now();
  DateTime tmpToTime = DateTime.now();

  final TextEditingController date = TextEditingController();
  Rx<String> serviceName = Rx('service'.tr);
  Rx<String> fromTime = Rx('');
  Rx<String> toTime = Rx('');
  Rx<String> province = Rx('');
  Rx<String> district = Rx('');
  Rx<String> level = Rx('${'supplier.filter.level_title'.tr}: ${'all'.tr}');
  Rx<int> star = Rx(0);
  Rx<int> isOnline = Rx(CommonConstants.online);
  List<DistrictsModel> lstDistrict = [];
  final serviceList = RxList<ServiceModel>();

  //tranfer data
  SupplierInfoModel supplier = SupplierInfoModel();

  BookingSupplierBookingController() {
    supplier = Get.arguments;

    date.value = TextEditingValue(text: DateFormatter.formatDate(fromDate));
    request.filterIsOnline = isOnline.value;
    request.filterLevelId = 0;
    _loadData();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .serviceListByCode(supplier.memberCode ?? '')
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.dataService != null &&
            response.dataService!.services != null) {
          serviceList.value = response.dataService!.services!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectService(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 2,
        child: ServiceWidget(
          services: serviceList,
          currentID: request.serviceId,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is ServiceModel) {
          if (_value.id == request.serviceId) {
            request.serviceId = 0;
            serviceName.value = 'service'.tr;
          } else {
            request.serviceId = _value.id;
            serviceName.value = _value.name ?? '';
            bookingPrepare.service = _value;
          }
        }
      },
    );
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

  Future<void> selectRadio(int value) async {
    isOnline.value = value;
    request.filterIsOnline = value;
    bookingPrepare.workingForm = value;
  }

  Future<void> search() async {
    try {
      request.filterDate = date.text;
      request.filterTimeSlot = '$fromTime - $toTime';
      request.limit = 20;
      request.offset = 0;
      bookingPrepare.supplier = supplier;
      bookingPrepare.supplierRequest = request;
      log('Log: ${bookingPrepare.supplierRequest.toString()}');

      var hours = tmpToTime.difference(tmpFromTime).inHours.toDouble();
      final minutes = tmpToTime.difference(tmpFromTime).inMinutes;
      final tmpMinutes = minutes - (hours * 60);
      if (tmpMinutes > 0 && tmpMinutes <= 15) {
        hours += 0.25;
      } else if (tmpMinutes > 15 && tmpMinutes <= 30) {
        hours += 0.5;
      } else if (tmpMinutes > 30 && tmpMinutes <= 45) {
        hours += 0.75;
      } else if (tmpMinutes > 45) {
        hours += 1;
      }
      bookingPrepare.totalTime = hours;

      var validater = false;
      var message = '';

      if (request.filterIsOnline == CommonConstants.offline &&
          (request.filterLocationProvinceId == null ||
              request.filterLocationDistrictId == null)) {
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
        bookingRequest.supplierId = supplier.id;
        bookingRequest.serviceId = request.serviceId;
        bookingRequest.workingForm = request.filterIsOnline;
        bookingRequest.workingDate = request.filterDate;
        bookingRequest.workingTime = request.filterTimeSlot;
        await EasyLoading.show();
        await _uiRepository.bookingCheckData(bookingRequest).then((response) {
          EasyLoading.dismiss();
          if (response.status == CommonConstants.statusOk) {
            //router
            bookingPrepare.supplier = response.data;
            Get.toNamed(Routes.BOOKING_SUPPLIER_CHECKOUT, arguments: bookingPrepare);
          } else {
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: IconConstants.icFail,
                title: response.message,
              ),
              onVaLue: (value) {},
            );
            return;
          }
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
