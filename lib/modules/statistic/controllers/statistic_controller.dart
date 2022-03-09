import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/statistic/statistic_invoice_model.dart';
import 'package:ui_api/models/statistic/statistic_model.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/date_formatter.dart';

class StatisticController extends BaseController {
  var scrollController = ScrollController();
  final _uiRepository = Get.find<HicoUIRepository>();
  Rx<int> indexStatus = Rx(0);
  int limit = CommonConstants.limit;
  int offset = 0;
  String keyword = '';
  String fromDate = '';
  String toDate = '';
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  Rx<StatisticModel> completed = Rx(StatisticModel());
  Rx<StatisticModel> canceled = Rx(StatisticModel());
  RxList<StatisticInvoiceModel> invoiceList = RxList<StatisticInvoiceModel>();

  Rx<int> totalInvoice = Rx(20);

  StatisticController() {
    fromDate =
        DateFormatter.formatDate(DateTime.now().add(const Duration(days: -7)));
    toDate = DateFormatter.formatDate(DateTime.now());
    loadData();
    loadInvoiceList();
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
          completed.value = response.data!.completed!;
          canceled.value = response.data!.canceled!;
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

  Future<void> onSearch(String value) async {
    try {
      keyword = value;
      await loadInvoiceList();
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadInvoiceList() async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .statisticsInvoice(limit, offset, keyword, fromDate, toDate)
          .then((response) {
        EasyLoading.dismiss();
        if (response.data!.rows!.isNotEmpty) {
          offset = response.data!.rows!.length;
          invoiceList.value = response.data!.rows!;
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
          .statisticsInvoice(limit, offset, keyword, fromDate, toDate)
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

  @override
  void onClose() {}
}
