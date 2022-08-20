import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/statistic/statistic_invoice_model.dart';
import 'package:ui_api/models/statistic/statistic_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';
import 'package:ui_api/request/invoice/invoice_request.dart';

import '../../../base/base_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/date_formatter.dart';

class StatisticController extends BaseController {
  var scrollController = ScrollController();
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<int> indexStatus = Rx(0);
  int limit = CommonConstants.limit;
  int offset = 0;
  String fromDate = '';
  String toDate = '';
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();

  Rx<StatisticModel> statistic = Rx(StatisticModel());
  RxList<StatisticInvoiceModel> invoiceList = RxList<StatisticInvoiceModel>();

  Rx<int> totalInvoice = Rx(20);

  StatisticController() {
    fromDate =
        DateFormatter.formatDate(DateTime.now().add(const Duration(days: -7)));
    toDate = DateFormatter.formatDate(DateTime.now());
    loadData();
  }

  @override
  Future<void> onInit() {
    // Setup the listener.
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          _loadMore();
        }
      }
    });

    return super.onInit();
  }

  Future<void> loadData() async {
    try {
      await _uiRepository.statistics().then((response) {
        if (response.status == CommonConstants.statusOk &&
            response.data != null) {
          statistic.value = response.data!;
          return;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectFromDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateFormatter.formatToDate(fromDate),
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null) {
      fromDate = DateFormatter.formatDate(picked);
      fromDateController.value = TextEditingValue(text: fromDate);
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateFormatter.formatToDate(toDate),
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null) {
      toDate = DateFormatter.formatDate(picked);
      toDateController.value = TextEditingValue(text: toDate);
    }
  }
  Future<void> onChangeStatus(int index) async {
    try {
      indexStatus.value = index;
      if(index != 0){
        await loadInvoiceList();
      }   
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadInvoiceList() async {
    try {
      await EasyLoading.show();
      offset = 0;
      await _uiRepository
          .statisticsInvoice(limit, offset, keywordController.text, fromDate, toDate, indexStatus.value)
          .then((response) {
        EasyLoading.dismiss();
        if (response.data!.rows!.isNotEmpty) {
          offset = response.data!.rows!.length;
          invoiceList.value = response.data!.rows!;
        }else{
          invoiceList.value = [];
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
          .statisticsInvoice(limit, offset, keywordController.text, fromDate, toDate, indexStatus.value)
          .then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset += response.data!.rows!.length;
            invoiceList.addAll(response.data!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onDetail(int id) async {
    await Get.toNamed(Routes.ORDER_DETAIL, arguments: InvoiceRequest(id:id));
  }

  @override
  void onClose() {}
}
