part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/';
  static const LANGUAGE = '/language';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_OTP = '/register_otp';
  static const REGISTER_SUCCESS = '/register_success';

  static const FORGOT_PASSWORD = '/forgot_password';
  static const FORGOT_PASSWORD_OTP = '/forgot_password_otp';
  static const FORGOT_PASSWORD_CHANGE = '/forgot_password_change';

  static const MAIN = '/main';
  static const MAIN_GUEST = '/main_guest';

  static const HOME = '/home';
  static const ORDER_LIST = '/order_list';
  static const ORDER_DETAIL = '/order_detail';
  static const NOTIFICATION = '/notification';
  static const NOTIFICATION_DETAIL = '/notification_detail';
  static const NEWS = '/news';
  static const NEWS_LIST = '/news_list';
  static const NEWS_DETAIL = '/news_detail';
  static const ACCOUNT = '/account';
  static const CONFIG = '/config';
  static const CONTACT = '/contact';
  static const BANK = '/bank';
  static const CHANGE_PASS = '/change_pass';
  static const POLICY = '/policy';
  static const PAYMENT_POLICY = '/payment_policy';
  static const TERMS_OF_USE = '/terms_of_use';
  static const SUPPORT = '/support';
  static const STATISTIC = '/statistic';
  static const PROFILE_UPDATE = '/profile_update';
  static const BANK_UPDATE = '/bank_update';
  //service
  static const SERVICE_CATEGORIES = '/service_categories';
  static const SERVICE = '/service';
  static const NEW_SERVICE = '/service_new';
  static const RECENT_SERVICE = '/service_recent';
  //supplier
  static const SUPPLIER_FILTER = '/supplier_filter';
  static const SUPPLIERS = '/suppliers';
  static const SUPPLIER_DETAIL = '/supplier_detail';
  static const SUPPLIER_BOOKING = '/supplier_booking';
  static const SUPPLIER_BOOKING_SUCCESS = '/supplier_booking_success';
  static const VOUCHER = '/vouchers';
  static const MY_VOUCHER = '/my_vouchers';
  static const PAYMENT_METHOD = '/payment_method';

  static const CONSULTING = '/consulting';
  static const SEARCH = '/search';

  static const CHAT = '/chat';
  static const VOICE_CALL = '/voice-call';
  static const VIDEO_CALL = '/video-call';
  static const TIME_EXTENSION = '/time_extension';
  static const BOOKING_DETAIL = '/booking_detail';
  static const WALLET = '/wallet/wallet';
  static const TOPUP_BANK = '/wallet/topup-bank';
  static const TOPUP_STRIPE = '/wallet/topup-stripe';
  static const TOPUP_DETAIL = '/wallet/topup-detail';
  static const TOPUP_KOMOJU = '/wallet/topup-komoju';

  //booking
  static const SUPPLIER_LIST = '/booking/supplier_list';
  static const BOOKING_SUPPLIER_DETAIL = '/booking/supplier_detail';
  static const BOOKING_SUPPLIER_BOOKING = '/booking/supplier_booking';
  static const BOOKING_SUPPLIER_CHECKOUT = '/booking/supplier_checkout';
}
