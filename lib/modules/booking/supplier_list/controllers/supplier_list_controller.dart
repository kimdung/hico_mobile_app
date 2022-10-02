import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/widget_hico/data_general/sort_order.dart';
import '../../../../shared/widgets/showbottom_sheet/show_bottom_sheet.dart';

class SupplierListController extends BaseController {
  // ignore: type_annotate_public_apis
  var scrollController = ScrollController();
  final _uiRepository = Get.find<HicoUIRepository>();
  RxList<SupplierInfoModel> suppliers = RxList<SupplierInfoModel>();
  Rx<int> serviceId = Rx(0);
  Rx<int> currentOrder = Rx(SortType.Orders.id);
  int limit = CommonConstants.limit;
  int offset = 0;
  ServiceModel? service;

  SupplierListController() {
    if (Get.arguments != null) {
      service = ServiceModel();
      service = Get.arguments;
      serviceId.value = service!.id!;
    }
    loadData();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          _loadMore();
        }
      }
    });
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadData() async {
    try {
      await EasyLoading.show();
      offset = 0;
      await _uiRepository
          .customerSuppliers(currentOrder.value, serviceId.value, limit, offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data?.suppliers != null) {
          suppliers.value = response.data!.suppliers!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore() async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .customerSuppliers(currentOrder.value, serviceId.value, limit, offset)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data?.suppliers != null) {
          offset += response.data!.suppliers!.length;
          suppliers.addAll(response.data!.suppliers!);
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> viewDetail(SupplierInfoModel item) async {
    await Get.toNamed(Routes.BOOKING_SUPPLIER_DETAIL, arguments: {
      CommonConstants.SUPPLIER_KEY: item,
      CommonConstants.SERVICE_KEY: service,
    });
  }

  Future<void> sortOrder(BuildContext context) async {
    await ShowBottomSheet().showBottomSheet(
      child: Container(
        height: Get.height / 2,
        child: SortOrderWidget(
          currentID: currentOrder.value,
        ),
      ),
      context: context,
      onValue: (_value) {
        if (_value != null && _value is int) {
          if (_value == currentOrder.value) {
            currentOrder.value = SortType.Random.id;
          } else {
            currentOrder.value = _value;
          }
          loadData();
        }
      },
    );
  }

  Future<void> filter() async {
    if (serviceId.value != 0) {
      await Get.toNamed(Routes.SUPPLIER_FILTER, arguments: service);
    } else {
      await Get.toNamed(Routes.SUPPLIER_FILTER);
    }
  }
}
