import 'package:flutter/material.dart';

class CommonConstants {
  static const num testNum = 1;
  static const double largeText = 16;
  static const double normalText = 14;
  static const double smallText = 12;
  static const double miniText = 10;

  static String orderID = '';
  static const dateFormat = 'dd/MM/yyyy';
  static const timeFormat = 'HH:mm';
  static const int male = 1;
  static const int female = 2;
  static const int statusOk = 1;
  static const int statusFailed = 0;
  static const double paddingDefault = 20;
  static const int limit = 20;

  static const int online = 1;
  static const int offline = 0;

  //star
  static const int oneStar = 1;
  static const int twoStar = 2;
  static const int threeStar = 3;
  static const int fourStar = 4;
  static const int fiveStar = 5;

  // Arguments key
  static const String INVOICE_ID = 'INVOICE_ID';
  static const String CHANNEL = 'CHANNEL';
  static const String CHAT_USER = 'CHAT_USER';
  static const String IS_NOT_CALL = 'IS_NOT_CALL';
  static const String IS_CALLER = 'IS_CALLER';
  static const String CALL_MODEL = 'CALL_MODEL';
  static const String CALL_TOKEN = 'CALL_TOKEN';
}

const APP_NAME = 'Hico';

const IMAGE_ASSET = 'lib/resource/images/';

// Environment
const DEV_ENVIRONMENT = 'dev_environment';
const UAT_ENVIRONMENT = 'uat_environment';
const PROD_ENVIRONMENT = 'prod_environment';

// Define Theme
const DARK_THEME = 'DARK';
const LIGHT_THEME = 'LIGHT';

// Define Language
const VIETNAMESE_LANG = 'vi';
const ENGLISH_LANG = 'en';
const JAPANESE_LANG = 'ja';

const GraphQLAuthUrl = 'GraphQLAuthUrl';
const GraphQLServiceUrl = 'GraphQLServiceUrl';
const WebSocketGraphQLUrl = 'WebSocketGraphQLUrl';
const MediaApiEnvironment = 'MediaApiEnvironment';
const DefaultLanguageCode = 'DefaultLanguageCode';
const UIAPIDomain = 'UIAPIDomain';
const ClientAPIDomain = 'ClientAPIDomain';
const LineChannelId = 'LineChannelId';
const StripePublishableKey = 'StripePublishableKey';

// URL DOWNLOAD APP
const URL_ANDROID =
    'https://play.google.com/store/apps/details?id=com.zhiliaoapp.musically&hl=vi&gl=US';
const URL_IOS = 'https://apps.apple.com/vn/app/tiktok/id1235601864?l=vi';

enum PaymentMethod { All, Banking, Online }

extension PaymentMethodName on PaymentMethod {
  String get name {
    switch (this) {
      case PaymentMethod.All:
        return '';
      case PaymentMethod.Banking:
        return 'Chuyển khoản ngân hàng';
      case PaymentMethod.Online:
        return 'Thanh toán online';
      default:
        return '';
    }
  }
}

enum DisplayType { All, Notif, Order, Extend, Rating }

extension DisplayTypeId on DisplayType {
  int get id {
    switch (this) {
      case DisplayType.All:
        return 0;
      case DisplayType.Notif:
        return 1;
      case DisplayType.Order:
        return 2;
      case DisplayType.Extend:
        return 7;
      case DisplayType.Rating:
        return 8;
      default:
        return 0;
    }
  }
}
