import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:ui_api/request/general/contact_request.dart';
import 'package:ui_api/request/invoice/booking_request.dart';
import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_otp_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/request/user/avatar_request.dart';
import 'package:ui_api/request/user/changepass_request.dart';
import 'package:ui_api/request/user/update_bank_request.dart';
import 'package:ui_api/request/user/update_info_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/address_response.dart';
import 'package:ui_api/response/general/bank_response.dart';
import 'package:ui_api/response/general/district_response.dart';
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

import '../request/invoice/extend_period_request.dart';
import '../response/call/call_token_response.dart';
import '../response/chat/chat_token_response.dart';
import '../response/wallet/topup_history_response.dart';
import '../response/wallet/topup_komaju_response.dart';
import '../response/wallet/topup_response.dart';
import '../response/invoice/extend_period_response.dart';

abstract class HicoUIRepository {
  /* User */
  Future<LoginResponse> login(LoginRequest loginRequest);

  /* Line */
  Future<LoginResponse> loginLine(LoginRequest loginRequest);

  /* GG */
  Future<LoginResponse> loginGG(LoginRequest loginRequest);

  /* FB */
  Future<LoginResponse> loginFB(LoginRequest loginRequest);

  //logout
  Future<BaseResponse> logout();

  //Register
  Future<BaseResponse> register(RegisterRequest request);

  //Register Otp
  Future<LoginResponse> registerOtp(RegisterOtpRequest request);

  //resend Otp
  Future<BaseResponse> resendOtp(String email);

  //updateLangCode
  Future<BaseResponse> updateLangCode(String code);

  //changePass
  Future<BaseResponse> changePassword(ChangePassRequest request);

  //update avatar
  Future<UserResponse> updateAvatar(File image);

  //update info
  Future<BaseResponse> updateInfo(UpdateInfoRequest request);

  //update info
  Future<BaseResponse> updateBank(UpdateBankRequest request);
  //get info
  Future<UserResponse> getInfo();

  //contact
  Future<BaseResponse> contact(ContactRequest request);

  //masterdata
  Future<MasterDataResponse> masterData();

  //news list
  Future<NewsListResponse> newsList(int limit, int offset);

  //news detail
  Future<NewsDetailResponse> newsDetail(int id);

  //notification list
  Future<NotificationListResponse> notificationList(int limit, int offset);

  //notification detail
  Future<NotificationDetailResponse> notificationDetail(int id);

  //home
  Future<HomeResponse> home();

  //Service categories
  Future<ServiceCategoriesResponse> serviceCategories(
      int limit, int offset, String searchWord);

  //Service list
  Future<ServiceListResponse> serviceList(
      int limit, int offset, int id, String searchWord);
  //Service new
  Future<ServiceListResponse> serviceNew(
      int limit, int offset, String searchWord);
  //Service list
  Future<ServiceListResponse> serviceRecent(
      int limit, int offset, String searchWord);

//Service list
  Future<BaseResponse> serviceView(int id);

  //Supplier list
  Future<SupplierResponse> supplierList(
    //SupplierRequest supplierRequest
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
  );

//Supplier profile
  Future<SupplierProfileResponse> supplierDetail(String memberCode);

  //get district list
  Future<DistrictResponse> getDistrict(int id);

  //get list invoice historry
  Future<InvoiceHistoryResponse> invoiceHistory(
    String searchWord,
    int status,
    int limit,
    int offset,
  );

  //get invoice detail
  Future<InvoiceDetailResponse> invoiceDetail(
    int id,
  );

  //invoice detail: changeSupplierRequest
  Future<BaseResponse> changeSupplierRequest(
    int id,
  );

  //invoice detail: editRequest
  Future<BaseResponse> editInvoiceRequest(
    int id,
  );
  //invoice detail: editRequest
  Future<BaseResponse> invoiceCancel(
    int id,
    String reason,
  );

  //invoice booking
  Future<BookingResponse> invoiceBooking(BookingRequest request);

  //voucher
  Future<VoucherResponse> voucherList(int limit, int offset);

  //voucher check
  Future<CheckVoucherResponse> voucherCheck(int id, double total);

  //address list
  Future<AddressResponse> addressList(int limit, int offset, String code);

  //statistics
  Future<StatisticsResponse> statistics();
  //statistics
  Future<StatisticInvoiceResponse> statisticsInvoice(
      int limit, int offset, String keyWords, String startDate, String endDate, int status);

  //consulting
  Future<BaseResponse> consulting(
    String name,
    String email,
    String phoneNumber,
    int provinceCode,
    int districtCode,
    int serviceId,
    String symptom,
  );

  //check UserTime
  Future<BaseResponse> forgetPassword(String email);
  //check UserTime
  Future<BaseResponse> resetPassword(
      String code, String email, String password);
  //bank list
  Future<BankResponse> banks();

  //extend period
  Future<ExtendPeriodResponse> extendPeriod();

  // Create chat token
  Future<ChatTokenResponse> createChatToken();

  // Create call token
  Future<CallTokenResponse> getCallToken(String channel);


  /* Wallet */

  Future<TopupHistoryResponse> topupHistory(int limit, int offset);

  Future<TopupResponse> topupBank(double amount);

  Future<TopupResponse> topupBankConfirm(
      File imageBill, String payInCode, String note);

  Future<TopupKomajuResponse> topupKomaju(double amount, int type);

  Future<TopupResponse> topupKomojuResult(String sessionId);

  Future<TopupResponse> topupStripe(
      String paymentMethodId, String name, double amount);

 
  //post extend 
  Future<BaseResponse> extendInvoice(ExtendPeriodRequest request);

}
 