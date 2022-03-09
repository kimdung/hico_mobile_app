import 'dart:io';

import 'package:ui_api/datasource/remote/hico_ui_api.dart';
import 'package:ui_api/request/general/contact_request.dart';
import 'package:ui_api/request/general/filter_request.dart';
import 'package:ui_api/request/invoice/booking_request.dart';
import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_otp_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/request/supplier/supplier_request.dart';
import 'package:ui_api/request/user/avatar_request.dart';
import 'package:ui_api/request/user/changepass_request.dart';
import 'package:ui_api/request/user/update_bank_request.dart';
import 'package:ui_api/request/user/update_info_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/address_response.dart';
import 'package:ui_api/response/general/district_response.dart';
import 'package:ui_api/response/general/general_response.dart';
import 'package:ui_api/response/general/master_data_response.dart';
import 'package:ui_api/response/home/home_response.dart';
import 'package:ui_api/response/invoice/booking_response.dart';
import 'package:ui_api/response/invoice/invoice_detail_response.dart';
import 'package:ui_api/response/invoice/invoice_history_response.dart';
import 'package:ui_api/response/news/news_detail_response.dart';
import 'package:ui_api/response/news/news_list_response.dart';
import 'package:ui_api/response/notifications/notification_detail_response.dart';
import 'package:ui_api/response/notifications/notification_list_response.dart';
import 'package:ui_api/response/service/service_categories_response.dart';
import 'package:ui_api/response/service/service_list_response.dart';
import 'package:ui_api/response/statistics/statistic_invoice_response.dart';
import 'package:ui_api/response/statistics/statistic_response.dart';
import 'package:ui_api/response/supplier/supplier_profile_response.dart';
import 'package:ui_api/response/supplier/supplier_response.dart';
import 'package:ui_api/response/user/login_response.dart';
import 'package:ui_api/response/user/user_response.dart';
import 'package:ui_api/response/voucher/check_voucher_response.dart';
import 'package:ui_api/response/voucher/voucher_response.dart';

import '../hico_ui_repository.dart';

class HicoUIRepositoryImpl extends HicoUIRepository {
  final HicoUIAPI _api;

  HicoUIRepositoryImpl(this._api);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _api.login(loginRequest);
  }

  @override
  Future<LoginResponse> loginLine(LoginRequest loginRequest) {
    return _api.loginLine(loginRequest);
  }

  @override
  Future<LoginResponse> loginGG(LoginRequest loginRequest) {
    return _api.loginGG(loginRequest);
  }

  @override
  Future<LoginResponse> loginFB(LoginRequest loginRequest) {
    return _api.loginFB(loginRequest);
  }

  @override
  Future<BaseResponse> logout() {
    return _api.logout();
  }

  @override
  Future<BaseResponse> register(RegisterRequest request) {
    return _api.register(request);
  }

  @override
  Future<BaseResponse> registerOtp(RegisterOtpRequest request) {
    return _api.registerOtp(request);
  }

  @override
  Future<BaseResponse> updateLangCode(String code) {
    return _api.updateLangCode(code);
  }

  @override
  Future<BaseResponse> changePassword(ChangePassRequest request) {
    return _api.changePassword(request);
  }

  @override
  Future<UserResponse> updateAvatar(File image) {
    return _api.updateAvatar(image);
  }

  @override
  Future<UserResponse> getInfo() {
    return _api.getInfo();
  }

  @override
  Future<BaseResponse> updateInfo(UpdateInfoRequest request) {
    return _api.updateInfo(request);
  }

  @override
  Future<BaseResponse> updateBank(UpdateBankRequest request) {
    return _api.updateBank(request);
  }

  @override
  Future<BaseResponse> contact(ContactRequest request) {
    return _api.contact(request);
  }

  @override
  Future<MasterDataResponse> masterData() {
    return _api.masterData();
  }

  @override
  Future<NewsListResponse> newsList(int limit, int offset) {
    return _api.newsList(limit, offset);
  }

  @override
  Future<NewsDetailResponse> newsDetail(int id) {
    return _api.newsDetail(id);
  }

  @override
  Future<NotificationListResponse> notificationList(int limit, int offset) {
    return _api.notificationList(limit, offset);
  }

  @override
  Future<NotificationDetailResponse> notificationDetail(int id) {
    return _api.notificationDetail(id);
  }

  @override
  Future<HomeResponse> home() {
    return _api.home();
  }

  //servcice
  @override
  Future<ServiceCategoriesResponse> serviceCategories(
      int limit, int offset, String searchWord) {
    return _api.serviceCategories(limit, offset, searchWord);
  }

  @override
  Future<ServiceListResponse> serviceList(
      int limit, int offset, int id, String searchWord) {
    return _api.serviceList(limit, offset, id, searchWord);
  }

  @override
  Future<ServiceListResponse> serviceNew(
      int limit, int offset, String searchWord) {
    return _api.serviceNew(limit, offset, searchWord);
  }

  @override
  Future<ServiceListResponse> serviceRecent(
      int limit, int offset, String searchWord) {
    return _api.serviceRecent(limit, offset, searchWord);
  }

  @override
  Future<BaseResponse> serviceView(int id) {
    return _api.serviceView(id);
  }

  //supplier
  @override
  Future<SupplierResponse> supplierList(
    int serviceId,
    String filterDate,
    String filterTimeSlot,
    int filterIsOnline,
    int filterLocationProvinceId,
    int filterLocationDistrictId,
    int filterLevelId,
    int? filterNumberStar,
    int limit,
    int offset,
  ) {
    return _api.supplierList(
      serviceId,
      filterDate,
      filterTimeSlot,
      filterIsOnline,
      filterLocationProvinceId,
      filterLocationDistrictId,
      filterLevelId,
      filterNumberStar,
      limit,
      offset,
    );
  }

  @override
  Future<SupplierProfileResponse> supplierDetail(String memberCode) {
    return _api.supplierDetail(memberCode);
  }

  @override
  Future<DistrictResponse> getDistrict(int id) {
    return _api.getDistrict(id);
  }

//invoice history
  @override
  Future<InvoiceHistoryResponse> invoiceHistory(
    String searchWord,
    int status,
    int limit,
    int offset,
  ) {
    return _api.invoiceHistory(searchWord, status, limit, offset);
  }

  //invoice detail
  @override
  Future<InvoiceDetailResponse> invoiceDetail(int id) {
    return _api.invoiceDetail(id);
  }

  //invoice detail:changeSupplierRequest
  @override
  Future<BaseResponse> changeSupplierRequest(int id) {
    return _api.changeSupplierRequest(id);
  }

  //invoice detail:editRequest
  @override
  Future<BaseResponse> editInvoiceRequest(int id) {
    return _api.editInvoiceRequest(id);
  }

  //invoice detail:cancel
  @override
  Future<BaseResponse> invoiceCancel(int id, String reason) {
    return _api.invoiceCancel(id, reason);
  }

  //invoice detail:cancel
  @override
  Future<BookingResponse> invoiceBooking(BookingRequest request) {
    return _api.invoiceBooking(request);
  }

  //voucher list
  @override
  Future<VoucherResponse> voucherList(int limit, int offset) {
    return _api.voucherList(limit, offset);
  }

  //voucher check
  @override
  Future<CheckVoucherResponse> voucherCheck(int id, double total) {
    return _api.voucherCheck(id, total);
  }

  //address list
  @override
  Future<AddressResponse> addressList(int limit, int offset, String code) {
    return _api.addressList(limit, offset, code);
  }

  //statistics
  @override
  Future<StatisticsResponse> statistics() {
    return _api.statistics();
  }

  //statistics
  @override
  Future<StatisticInvoiceResponse> statisticsInvoice(int limit, int offset,
      String keyWords, String startDate, String endDate) {
    return _api.statisticsInvoice(limit, offset, keyWords, startDate, endDate);
  }

  //consulting
  @override
  Future<BaseResponse> consulting(
    String name,
    String email,
    String phoneNumber,
    int provinceCode,
    int districtCode,
    int serviceId,
    String symptom,
  ) {
    return _api.consulting(
      name,
      email,
      phoneNumber,
      provinceCode,
      districtCode,
      serviceId,
      symptom,
    );
  }

  @override
  Future<BaseResponse> forgetPassword(String email) {
    return _api.forgetPassword(email);
  }

  @override
  Future<BaseResponse> resetPassword(
      String code, String email, String password) {
    return _api.resetPassword(code, email, password);
  }
}
