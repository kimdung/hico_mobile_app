import 'package:hico/resource/assets_constant/icon_constants.dart';

class PaymentMethodItem {
  static List<PaymentMethodItem> paymentMethods = [
    PaymentMethodItem(
        0, 'topup.bank', 'topup.bank.description', IconConstants.icCard),
    PaymentMethodItem(1, 'topup.komoju1', 'topup.komoju.description1',
        IconConstants.icKomaju),
    PaymentMethodItem(2, 'topup.komoju2', 'topup.komoju.description2',
        IconConstants.icKomaju),
    PaymentMethodItem(
        3, 'topup.stripe', 'topup.stripe.description', IconConstants.icStripe),
  ];

  int id;
  String title;
  String description;
  String icon;

  PaymentMethodItem(this.id, this.title, this.description, this.icon);
}
