import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ui_api/request/general/contact_request.dart';
import 'package:ui_api/request/invoice/booking_request.dart';
import 'package:ui_api/request/invoice/rating_request.dart';
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

import '../../response/call/call_token_response.dart';
import '../../response/chat/chat_token_response.dart';
part 'hico_ui_api.g.dart';

@RestApi()
abstract class HicoUIAPI {
  factory HicoUIAPI(Dio dio) = _HicoUIAPI;
  //master data
  @GET('/v1/masterData')
  Future<MasterDataResponse> masterData();

  //User
  @POST('/v1/customer/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  //Login Line
  @POST('/v1/customer/auth/loginWithLine')
  Future<LoginResponse> loginLine(@Body() LoginRequest request);

  //Login GG
  @POST('/v1/customer/auth/loginWithGoogle')
  Future<LoginResponse> loginGG(@Body() LoginRequest request);

  //Login FB
  @POST('/v1/customer/auth/loginWithFacebook')
  Future<LoginResponse> loginFB(@Body() LoginRequest request);

  //master data
  @GET('/v1/customer/auth/logout')
  Future<BaseResponse> logout();

  //Register
  @POST('/v1/customer/auth/register')
  Future<BaseResponse> register(@Body() RegisterRequest request);

  //Register Otp
  @POST('/v1/customer/auth/active')
  Future<LoginResponse> registerOtp(@Body() RegisterOtpRequest request);

  //resend Otp
  @POST('/v1/customer/auth/resendActive')
  Future<BaseResponse> resendOtp(
    @Query('email') String email,
  );

  //updateLangCode
  @POST('/v1/updateLangCode')
  Future<BaseResponse> updateLangCode(
    @Query('lang_code') String code,
  );

  //updateLangCode
  @POST('/v1/customer/password/change')
  Future<BaseResponse> changePassword(@Body() ChangePassRequest request);

  //update avatar
  @POST('/v1/user/update/avatar')
  Future<UserResponse> updateAvatar(@Part() File avatar_image);

  //update info
  @POST('/v1/customer/user/update')
  Future<BaseResponse> updateInfo(@Body() UpdateInfoRequest request);

  //update bank
  @POST('/v1/customer/user/updateBank')
  Future<BaseResponse> updateBank(@Body() UpdateBankRequest request);

  // get info
  @GET('/v1/customer/me')
  Future<UserResponse> getInfo();

//contact
  @POST('/v1/contact')
  Future<BaseResponse> contact(@Body() ContactRequest request);

  // home
  @GET('/v1/customer/home')
  Future<HomeResponse> home();

  // news
  @GET('/v1/news/list')
  Future<NewsListResponse> newsList(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  // news detail
  @GET('/v1/news/detail')
  Future<NewsDetailResponse> newsDetail(
    @Query('news_id') int id,
  );

// notification
  @GET('/v1/notification/list')
  Future<NotificationListResponse> notificationList(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  // notification detail
  @GET('/v1/notification/detail')
  Future<NotificationDetailResponse> notificationDetail(
    @Query('notification_id') int id,
  );

  //service categories
  @GET('/v1/customer/category/list')
  Future<ServiceCategoriesResponse> serviceCategories(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('searchWord') String searchWord,
  );

  //service list
  @GET('/v1/customer/service/list/byCategory')
  Future<ServiceListResponse> serviceList(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('service_category_id') int id,
    @Query('searchWord') String searchWord,
  );

  //service new
  @GET('/v1/customer/service/list')
  Future<ServiceListResponse> serviceNew(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('searchWord') String searchWord,
  );

  //service new
  @GET('/v1/customer/service/list/viewer')
  Future<ServiceListResponse> serviceRecent(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('searchWord') String searchWord,
  );

  //service view
  @POST('/v1/customer/serviceView/create')
  Future<BaseResponse> serviceView(
    @Query('service_id') int id,
  );

  //filter supplier
  @GET('/v1/customer/service/suppliers')
  Future<SupplierResponse> supplierList(
    @Query('service_id') int serviceId,
    @Query('filter_date') String filterDate,
    @Query('filter_time_slot') String filterTimeSlot,
    @Query('filter_is_online') int filterIsOnline,
    @Query('filter_location_province_id') int filterLocationProvinceId,
    @Query('filter_location_district_id') int filterLocationDistrictId,
    @Query('filter_level_id') int filterLevelId,
    @Query('filter_number_star') int? filterNumberStar,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

//filter supplier
  @GET('/v1/supplier/detailInfo')
  Future<SupplierProfileResponse> supplierDetail(
      @Query('member_code') String memberCode);

  //get district
  @GET('/v1/listDistrictByProvince')
  Future<DistrictResponse> getDistrict(
    @Query('province_id') int id,
  );

  //invoice
  @GET('/v1/customer/invoice/history')
  Future<InvoiceHistoryResponse> invoiceHistory(
    @Query('key_words') String searchWord,
    @Query('status') int status,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  //invoice detail
  @GET('/v1/customer/invoice/detail')
  Future<InvoiceDetailResponse> invoiceDetail(
    @Query('invoice_id') int id,
  );

  //invoice changeSupplier
  @POST('/v1/customer/invoice/changeSupplierRequest')
  Future<BaseResponse> changeSupplierRequest(
    @Query('invoice_id') int id,
  );

  //invoice editRequest
  @POST('/v1/customer/invoice/editRequest')
  Future<BaseResponse> editInvoiceRequest(
    @Query('invoice_id') int id,
  );

  //invoice cancel
  @POST('/v1/customer/invoice/cancel')
  Future<BaseResponse> invoiceCancel(
    @Query('invoice_id') int id,
    @Query('reason') String reason,
  );

  //invoice rating
  @POST('/v1/customer/review/send')
  Future<BaseResponse> invoiceRating(
    @Body() RatingRequest ratingRequest,
  );

  //invoice booking
  @POST('/v1/customer/invoice/create')
  Future<BookingResponse> invoiceBooking(
    @Body() BookingRequest request,
  );

  //voucher
  @GET('/v1/voucher/list')
  Future<VoucherResponse> voucherList(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  //voucher
  @POST('/v1/voucher/check')
  Future<CheckVoucherResponse> voucherCheck(
    @Query('voucher_id') int id,
    @Query('total') double total,
  );

  //get address
  @GET('/v1/address/list')
  Future<AddressResponse> addressList(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('code') String code,
  );

  //Statistics
  @GET('/v1/customer/invoice/statistics')
  Future<StatisticsResponse> statistics();

  //Statistics Invoice
  @GET('/v1/customer/invoice/invoiceCompleteList')
  Future<StatisticInvoiceResponse> statisticsInvoice(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('key_words') String keyWords,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );

  //consulting
  @POST('/v1/customer/register/consulting')
  Future<BaseResponse> consulting(
    @Query('name') String name,
    @Query('email') String email,
    @Query('phone_number') String phoneNumber,
    @Query('province_code') int provinceCode,
    @Query('district_code') int districtCode,
    @Query('service_id') int serviceId,
    @Query('symptom') String symptom,
  );
  //Forgotpass
  @POST('/api/v1/customer/password/forget')
  Future<BaseResponse> forgetPassword(
    @Query('email') String email,
  );

  //ResetPass
  @POST('/api/v1/customer/password/reset')
  Future<BaseResponse> resetPassword(
    @Query('code') String code,
    @Query('email') String email,
    @Query('new_password') String password,
  );

  //get bank list
  @GET('/v1/bank/list/customer')
  Future<BankResponse> banks();

  //Get Token
  @POST('/v1/conversation/createToken')
  Future<ChatTokenResponse> createChatToken();

  //Get Token
  @POST('/v1/agoraCall/createToken')
  Future<CallTokenResponse> getCallToken(@Query('channel') String channel);
}
