import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/hico_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart' as common;
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/utils/focus.dart';
import '../../../../shared/widget_hico/dialog/normal_widget.dart';

class TopupStripeController extends BaseController {
  final _uiRepository = Get.find<HicoUIRepository>();
  final formState = GlobalKey<FormState>();

  final cardEditController = CardFormEditController();

  late double amount;
  CardFieldInputDetails? card;
  bool isOrder = false;

  final accountHolderController = TextEditingController();
  final bankNumberController =
      MaskedTextController(mask: '0000 0000 0000 0000 000');
  final validDateController = MaskedTextController(mask: '00/00');
  final cvvController = TextEditingController();

  int? expirationMonth;
  int? expirationYear;

  TopupStripeController() {
    final arguments = Get.arguments as Map;
    isOrder = arguments['TOPUP_ISORDER'];
    amount = arguments['TOPUP_DATA'];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Action */

  Future<void> onConfirm() async {
    // if (!cardEditController.details.complete) {
    //   return;
    // }
    AppFocus.unFocus();

    if (formState.currentState == null || !formState.currentState!.validate()) {
      return;
    }

    await Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
      number: bankNumberController.text,
      cvc: cvvController.text,
      expirationMonth: expirationMonth,
      expirationYear: expirationYear == null ? null : 2000 + expirationYear!,
    ));
    final billingDetails =
        BillingDetails(name: accountHolderController.text); // mocked data
    try {
      await EasyLoading.show();
      final paymentMethod = await Stripe.instance
          .createPaymentMethod(
              params: PaymentMethodParams.card(
                  paymentMethodData:
                      PaymentMethodData(billingDetails: billingDetails)))
          .catchError(
        (onError) async {
          printInfo(info: onError.toString());
          await DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: '${'topup.failure'.tr}\n${onError?.error?.message ?? ''}',
            ),
            // onVaLue: (value) {
            //   Get.back();
            // },
          );
        },
      );
      // final paymentMethod = await Stripe.instance
      //     .createPaymentMethod(
      //         params: PaymentMethodParams.card(billingDetails: billingDetails))
      //     .catchError(
      //   (onError) async {
      //     printInfo(info: onError.toString());
      //     await DialogUtil.showPopup(
      //       dialogSize: DialogSize.Popup,
      //       barrierDismissible: false,
      //       backgroundColor: Colors.transparent,
      //       child: NormalWidget(
      //         icon: IconConstants.icFail,
      //         title: '${'topup.failure'.tr}\n${onError?.error?.message ?? ''}',
      //       ),
      //       // onVaLue: (value) {
      //       //   Get.back();
      //       // },
      //     );
      //   },
      // );
      await _requestPayment(paymentMethod);
    } on StripeError catch (error) {
      await EasyLoading.dismiss();
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: '${error.message}',
        ),
        onVaLue: (value) {
          Get.back();
        },
      );
    }
  }

  /* API */

  Future<void> _requestPayment(PaymentMethod paymentMethod) async {
    try {
      await _uiRepository
          .topupStripe(
              paymentMethod.id, paymentMethod.billingDetails.name ?? '', amount)
          .then((response) async {
        if (response.status == common.CommonConstants.statusOk &&
            response.data != null &&
            response.data!.row != null) {
          await _uiRepository.getInfo().then((response) {
            if (response.status == common.CommonConstants.statusOk &&
                response.data != null &&
                response.data!.info != null) {
              AppDataGlobal.userInfo = response.data!.info!;
            }
          });
          await EasyLoading.dismiss();
          if (isOrder) {
            Get.back(result: isOrder);
          } else {
            await Get.offAndToNamed(Routes.TOPUP_DETAIL,
                arguments: response.data!.row);
          }
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: NormalWidget(
              icon: IconConstants.icFail,
              title: response.message ?? 'topup.failure'.tr,
            ),
            onVaLue: (value) {
              Get.back();
            },
          );
        }
      }).catchError(
        (onError) {
          EasyLoading.dismiss();
          DialogUtil.showPopup(
            dialogSize: DialogSize.Popup,
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            child: const NormalWidget(
              icon: IconConstants.icFail,
              title: 'There was an error processing, please try again!',
            ),
            onVaLue: (value) {
              Get.back();
            },
          );
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
