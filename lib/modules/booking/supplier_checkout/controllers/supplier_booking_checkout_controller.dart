import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/user/address_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/models/voucher/check_voucher_data.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:ui_api/request/invoice/booking_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';
import '../../../../shared/widget_hico/dialog/topup_widget.dart';

class SupplierBookingCheckoutController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<BookingPrepareRequest> bookingPrepare = Rx(BookingPrepareRequest());
  Rx<BookingRequest> bookingRequest = Rx(BookingRequest());
  Rx<int> discount = Rx<int>(0);
  Rx<double> totalPay = Rx<double>(0);
  Rx<double> total = Rx<double>(0);
  CheckVoucherModel voucherTmp = CheckVoucherModel();
  Rx<int> showSuggest = Rx<int>(0);
  RxList<AddressModel> addressList = RxList<AddressModel>();

  Rx<UserInfoModel> info = Rx(UserInfoModel());
  final paymentMethodId = Rx(0);
  double? hours = 0;

  final TextEditingController zipCode = TextEditingController();
  final TextEditingController province = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController addressDetail = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController station = TextEditingController();

  SupplierBookingCheckoutController() {
    bookingPrepare.value = Get.arguments;
    if (bookingPrepare.value.supplierRequest!.filterIsOnline == CommonConstants.online) {
      total.value = bookingPrepare.value.supplier!.servicePrice! *
          bookingPrepare.value.totalTime!;
      totalPay.value = total.value;
    } else {
      if (bookingPrepare.value.totalTime! <
          bookingPrepare.value.supplier!.serviceOfflineMinHours!) {
        total.value =
            bookingPrepare.value.supplier!.serviceOfflineMinPrice!.toDouble();
        totalPay.value = total.value;
      } else {
        hours = bookingPrepare.value.totalTime! -
            bookingPrepare.value.supplier!.serviceOfflineMinHours!;
        var preTotal = hours! * bookingPrepare.value.supplier!.servicePrice!;
        total.value =
            bookingPrepare.value.supplier!.serviceOfflineMinPrice!.toDouble() +
                preTotal;
        totalPay.value = total.value;
      }
    }

    bookingRequest.value.supplierId = bookingPrepare.value.supplier!.id!;
    bookingRequest.value.serviceId = bookingPrepare.value.service!.id!;
    bookingRequest.value.workingForm =
        bookingPrepare.value.supplierRequest!.filterIsOnline!;
    bookingRequest.value.workingDate =
        bookingPrepare.value.supplierRequest!.filterDate!;
    bookingRequest.value.workingTime =
        bookingPrepare.value.supplierRequest!.filterTimeSlot!;
    _loadData();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> _loadData() async {
    info.value = AppDataGlobal.userInfo!;
    info.refresh();
  }

  Future<void> loadVoucher() async {
    await Get.toNamed(Routes.VOUCHER, arguments: totalPay.value)?.then((value) {
      if (value != null) {
        voucherTmp = value;
        discount.value = voucherTmp.discount!;
        totalPay.value = total.value + discount.value;
        bookingRequest.value.voucherId = voucherTmp.voucherId;
      }
    });
  }

  Future<void> loadPaymentMethod() async {
    await Get.toNamed(Routes.PAYMENT_METHOD,
            arguments: bookingRequest.value.paymentType)
        ?.then((value) {
      if (value != null) {
        bookingRequest.value.paymentType = value;
        paymentMethodId.value = value;
      }
    });
  }

  void closeSuggest() {
    showSuggest.value = 0;
  }

  Future<void> loadAddress(String keyword) async {
    try {
      // zipCode.text = '';
      province.text = '';
      district.text = '';
      addressDetail.text='';
      bookingRequest.value.addressId = 0;
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

  Future<void> selectAddress(AddressModel item) async {
    try {
      zipCode.text = item.code ?? '';
      province.text = item.provinceName ?? '';
      district.text = item.districtName ?? '';
      addressDetail.text = item.address ?? '';
      bookingRequest.value.addressId = item.id;
      showSuggest.value = 0;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> booking() async {
    try {
      await EasyLoading.show();
      if (bookingRequest.value.workingForm == CommonConstants.offline) {
        bookingRequest.value.address = addressDetail.text;
        bookingRequest.value.nearestStation = station.text;
        bookingRequest.value.hospitalName = address.text;
      }

      await _uiRepository.getInfo().then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.info != null) {
          info.value = response.data!.info!;
          AppDataGlobal.userInfo = response.data!.info!;
          return;
        }
      });

      if (info.value.accountBalance! < totalPay.value) {
        await EasyLoading.dismiss();
        await DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: TopupWidget(
            icon: IconConstants.icFail,
            title: 'booking.wallet_not_enough'.tr,
          ),
          onVaLue: (_value) {
            if (_value != null && _value is int) {
              if (_value == 1) {
                Get.toNamed(Routes.WALLET, arguments: true)!
                    .then((value) => info.value = AppDataGlobal.userInfo!);
              }
            }
          },
        );
        return;
      }
      await _uiRepository.invoiceBooking(bookingRequest.value).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk) {
          _uiRepository.getInfo().then((response) {
            if (response.status == CommonConstants.statusOk &&
                response.data != null &&
                response.data!.info != null) {
              AppDataGlobal.userInfo = response.data!.info!;
              return;
            }
          });
          Get.toNamed(Routes.SUPPLIER_BOOKING_SUCCESS,
              arguments: response.message);
        } else {
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
            onVaLue: (value) {},
          );
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {}
}
