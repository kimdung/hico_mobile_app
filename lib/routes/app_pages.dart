import 'package:get/get.dart';

import '../modules/bank/bindings/bank_binding.dart';
import '../modules/bank/views/bank_update_screen.dart';
import '../modules/call/video_call/bindings/video_call_binding.dart';
import '../modules/call/video_call/views/video_call_view.dart';
import '../modules/call/voice_call/bindings/voice_call_binding.dart';
import '../modules/call/voice_call/views/voice_call_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_screen.dart';
import '../modules/config/bindings/config_binding.dart';
import '../modules/config/views/bank_screen.dart';
import '../modules/config/views/change_pass_screen.dart';
import '../modules/config/views/config_screen.dart';
import '../modules/config/views/contact_screen.dart';
import '../modules/config/views/payment_policy_screen.dart';
import '../modules/config/views/policy_screen.dart';
import '../modules/config/views/terms_of_use_screen.dart';
import '../modules/consulting/bindings/consulting_binding.dart';
import '../modules/consulting/views/consulting_screen.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_change_screen.dart';
import '../modules/forgot_password/views/forgot_password_otp_screen.dart';
import '../modules/forgot_password/views/forgot_password_screen.dart';
import '../modules/language/binding/language_binding.dart';
import '../modules/language/view/language_screen.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_screen.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_screen.dart';
import '../modules/news_detail/bindings/news_detail_binding.dart';
import '../modules/news_detail/views/news_detail_screen.dart';
import '../modules/news_list/bindings/news_list_binding.dart';
import '../modules/news_list/views/news_list_screen.dart';
import '../modules/notification_detail/bindings/notification_detail_binding.dart';
import '../modules/notification_detail/views/notification_detail_screen.dart';
import '../modules/on_boarding/binding/on_boarding_binding.dart';
import '../modules/on_boarding/view/on_boarding_screen.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_screen.dart';
import '../modules/payment_method/bindings/payment_method_binding.dart';
import '../modules/payment_method/views/payment_method_screen.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_screen.dart';
import '../modules/profile/views/profile_update_screen.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_otp_screen.dart';
import '../modules/register/views/register_screen.dart';
import '../modules/register/views/register_success_screen.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_screen.dart';
import '../modules/service/bindings/new_service_binding.dart';
import '../modules/service/bindings/recent_service_binding.dart';
import '../modules/service/bindings/service_binding.dart';
import '../modules/service/views/new_service_screen.dart';
import '../modules/service/views/recent_service_screen.dart';
import '../modules/service/views/service_screen.dart';
import '../modules/service_categories/bindings/service_categories_binding.dart';
import '../modules/service_categories/views/service_categories_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';
import '../modules/statistic/bindings/statistic_binding.dart';
import '../modules/statistic/views/statistic_screen.dart';
import '../modules/supplier/bindings/suppiler_booking_binding.dart';
import '../modules/supplier/bindings/suppiler_booking_success_binding.dart';
import '../modules/supplier/bindings/supplier_binding.dart';
import '../modules/supplier/bindings/supplier_detail_binding.dart';
import '../modules/supplier/bindings/supplier_filter_binding.dart';
import '../modules/supplier/views/supplier_booking_screen.dart';
import '../modules/supplier/views/supplier_booking_success_screen.dart';
import '../modules/supplier/views/supplier_detail_screen.dart';
import '../modules/supplier/views/supplier_filter_screen.dart';
import '../modules/supplier/views/supplier_screen.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_screen.dart';
import '../modules/voucher/bindings/voucher_binding.dart';
import '../modules/voucher/views/voucher_screen.dart';

part 'app_routes.dart';

const INITIAL = Routes.SPLASH;

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.LANGUAGE,
    page: () => LanguageScreen(),
    binding: LanguageBinding(),
  ),
  GetPage(
    name: Routes.ONBOARDING,
    page: () => OnBoardingScreen(),
    binding: OnBoardingBinding(),
  ),

  //login
  GetPage(
    name: Routes.LOGIN,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),

  //register
  GetPage(
    name: Routes.REGISTER,
    page: () => RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.REGISTER_OTP,
    page: () => RegisterOtpScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.REGISTER_SUCCESS,
    page: () => RegisterSuccessScreen(),
    binding: RegisterBinding(),
  ),

  //forgot pass
  GetPage(
    name: Routes.FORGOT_PASSWORD,
    page: () => ForgotPasswordScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.FORGOT_PASSWORD_OTP,
    page: () => ForgotPasswordOTPScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.FORGOT_PASSWORD_CHANGE,
    page: () => ForgotPasswordChangeScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.MAIN,
    page: () => MainScreen(),
    binding: MainBinding(),
  ),
  GetPage(
      name: Routes.ORDER_DETAIL,
      page: () => OrderScreen(),
      binding: OrderBinding()),

  //notification
  // GetPage(
  //     name: Routes.NOTIFICATION,
  //     page: () => NotificationScreen(),
  //     binding: NotificationBinding()),
  GetPage(
      name: Routes.NOTIFICATION_DETAIL,
      page: () => NotificationDetailScreen(),
      binding: NotificationDetailBinding()),

  //account
  //GetPage(name: Routes.NEWS, page: () => NewsScreen(), binding: NewsBinding()),
  // GetPage(
  //     name: Routes.ACCOUNT,
  //     page: () => AccountScreen(),
  //     binding: AccountBinding()),
  GetPage(
      name: Routes.NEWS_LIST,
      page: () => NewsListScreen(),
      binding: NewsListBinding()),

  GetPage(
      name: Routes.NEWS_DETAIL,
      page: () => NewsDetailScreen(),
      binding: NewsDetailBinding()),
  GetPage(
      name: Routes.CONFIG,
      page: () => ConfigScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.CONTACT,
      page: () => ContactScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.BANK, page: () => BankScreen(), binding: ConfigBinding()),
  GetPage(
      name: Routes.CHANGE_PASS,
      page: () => ChangePassScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.POLICY,
      page: () => PolicyScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.PAYMENT_POLICY,
      page: () => PaymentPolicyScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.TERMS_OF_USE,
      page: () => TermOfUseScreen(),
      binding: ConfigBinding()),
  GetPage(
      name: Routes.SUPPORT,
      page: () => SupportScreen(),
      binding: SupportBinding()),
  GetPage(
      name: Routes.STATISTIC,
      page: () => StatisticScreen(),
      binding: StatisticBinding()),
  GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding()),
  GetPage(
    name: Routes.PROFILE_UPDATE,
    page: () => ProfileUpdateScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.BANK_UPDATE,
    page: () => BankUpdateScreen(),
    binding: BankBinding(),
  ),
  //service
  GetPage(
    name: Routes.SERVICE_CATEGORIES,
    page: () => ServiceCategoriesScreen(),
    binding: ServiceCategoriesBinding(),
  ),
  GetPage(
    name: Routes.SERVICE,
    page: () => ServiceScreen(),
    binding: ServiceBinding(),
  ),
  GetPage(
    name: Routes.NEW_SERVICE,
    page: () => NewServiceScreen(),
    binding: NewServiceBinding(),
  ),
  GetPage(
    name: Routes.RECENT_SERVICE,
    page: () => RecentServiceScreen(),
    binding: RecentServiceBinding(),
  ),
  //supplier
  GetPage(
    name: Routes.SUPPLIER_FILTER,
    page: () => SupplierFilterScreen(),
    binding: SupplierFilterBinding(),
  ),
  GetPage(
    name: Routes.SUPPLIERS,
    page: () => SupplierScreen(),
    binding: SupplierBinding(),
  ),
  GetPage(
    name: Routes.SUPPLIER_DETAIL,
    page: () => SupplierDetailScreen(),
    binding: SupplierDetailBinding(),
  ),
  GetPage(
    name: Routes.SUPPLIER_BOOKING,
    page: () => SupplierBookingScreen(),
    binding: SupplierBookingBinding(),
  ),
  GetPage(
    name: Routes.SUPPLIER_BOOKING_SUCCESS,
    page: () => SupplierBookingSuccessScreen(),
    binding: SupplierBookingSuccessBinding(),
  ),
  GetPage(
    name: Routes.VOUCHER,
    page: () => VoucherScreen(),
    binding: VoucherBinding(),
  ),
  GetPage(
    name: Routes.PAYMENT_METHOD,
    page: () => PaymentMethodScreen(),
    binding: PaymentMethodBinding(),
  ),
  GetPage(
    name: Routes.CONSULTING,
    page: () => ConsultingScreen(),
    binding: ConsultingBinding(),
  ),
  GetPage(
    name: Routes.SEARCH,
    page: () => SearchScreen(),
    binding: SearchBinding(),
  ),
  GetPage(
    name: Routes.CHAT,
    page: () => ChatScreen(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: Routes.VOICE_CALL,
    page: () => VoiceCallView(),
    binding: VoiceCallBinding(),
  ),
  GetPage(
    name: Routes.VIDEO_CALL,
    page: () => VideoCallView(),
    binding: VideoCallBinding(),
  ),
];
