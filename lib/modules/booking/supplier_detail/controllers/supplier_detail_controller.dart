import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/supplier/supplier_profile_model.dart';
import 'package:ui_api/models/user/services_model.dart';
import 'package:ui_api/models/user/workplaces_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/booking_prepare_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';

class BookingSupplierDetailController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final profile = Rx(SupplierProfileModel());

  BookingPrepareRequest bookingPrepare = BookingPrepareRequest();

  BookingSupplierDetailController() {
    final code = Get.arguments;
    _loadData(code);
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> _loadData(String code) async {
    try {
      await EasyLoading.show();
      await _uiRepository.supplierDetail(code).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.profile != null) {
          profile.value = response.data!.profile!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onBooking() async {
    await Get.toNamed(Routes.SUPPLIER_BOOKING, arguments: bookingPrepare);
  }
  Future<void> openLink(String url) async {
    final _url = Uri.parse(url);
    await launchUrl(_url);
  }

  Future<void> changeServiceArrow(UserServicesCategoryModel item) async {
    try{
      item.openChild = !item.openChild!;
      var index = profile.value.customServices?.indexWhere((element) => element.serviceCategoryId == item.serviceCategoryId);
      if (index != -1) {
        profile.value.customServices?[index!] = item;
        profile.refresh();
      }
    }catch(e){
      await EasyLoading.dismiss();
    }
    
  }

  Future<void> changeArrow(WorkplacesModel item) async {
    try{
      item.openChild = !item.openChild!;
      var index = profile.value.customWorkplaces?.indexWhere((element) => element.provinceId == item.provinceId);
      if (index != -1) {
        profile.value.customWorkplaces?[index!] = item;
        profile.refresh();
      }
    }catch(e){
      await EasyLoading.dismiss();
    }
    
  }
}
