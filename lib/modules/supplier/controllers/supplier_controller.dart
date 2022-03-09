import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:ui_api/request/supplier/supplier_request.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';

class SupplierController extends BaseController {
  final Rx<int> totalRecord = Rx(0);
  int limit = 20;
  int offset = 0;
  final HicoUIRepository _uiRepository;
  final suppliers = RxList<SupplierInfoModel>();

  SupplierRequest request = SupplierRequest();
  BookingPrepareRequest bookingPrepare = BookingPrepareRequest();

  SupplierController(this._uiRepository) {
    bookingPrepare = Get.arguments;
    request = bookingPrepare.supplierRequest!;
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
          .supplierList(
        request.serviceId!,
        request.filterDate!,
        request.filterTimeSlot!,
        request.filterIsOnline!,
        request.filterLocationProvinceId!,
        request.filterLocationDistrictId!,
        request.filterLevelId!,
        request.filterNumberStar,
        limit,
        offset,
      )
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.suppliers != null) {
          suppliers.value = response.data!.suppliers!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> search(String text) async {
    await _loadData();
  }

  Future<void> viewDetail(SupplierInfoModel supplier) async {
    bookingPrepare.supplier = supplier;
    await Get.toNamed(Routes.SUPPLIER_DETAIL, arguments: bookingPrepare);
  }

  Future<void> onBooking(SupplierInfoModel supplier) async {
    bookingPrepare.supplier = supplier;
    await Get.toNamed(Routes.SUPPLIER_BOOKING, arguments: bookingPrepare);
  }

  @override
  void onClose() {}
}
