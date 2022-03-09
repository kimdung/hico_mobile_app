import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../controllers/forgot_password_controller.dart';

//part 'forgot_password_extension.dart';

class ForgotPasswordOTPScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'forgot_password.title'.tr,
          style: TextStyle(
            color: AppColor.thirdTextColorLight,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                      child: Image.asset(ImageConstants.forgotPasswordOtp)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Text(
                    'forgot_password.notification'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.thirdTextColorLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Text(
                    controller.emailHidden.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primaryTextColorLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: AppColor.primaryTextColorLight,
                      fontWeight: FontWeight.w500,
                    ),
                    length: 4,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    errorTextSpace: 20,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 48,
                      fieldWidth: 48,
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      activeFillColor: AppColor.secondBackgroundColorLight,
                      borderWidth: 1,
                      activeColor: AppColor.secondBackgroundColorLight,
                      selectedColor: AppColor.secondBackgroundColorLight,
                      inactiveColor: AppColor.secondBackgroundColorLight,
                      selectedFillColor: AppColor.secondBackgroundColorLight,
                      inactiveFillColor: AppColor.secondBackgroundColorLight,
                      errorBorderColor: AppColor.secondBackgroundColorLight,
                    ),
                    cursorColor: AppColor.primaryColorLight,
                    animationDuration: const Duration(milliseconds: 100),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadows: [
                      const BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 7,
                      )
                    ],
                    onCompleted: (v) {
                      // call api check otp
                      controller.onConfirm(v);
                    },
                    // ignore: unnecessary_lambdas
                    onChanged: (value) {
                      // ignore: avoid_print
                      print(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'register.miss_otp'.tr,
                        style: TextAppStyle().secondTextStyle(),
                      ),
                      const SizedBox(width: 8),
                      Text('register.resend'.tr),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
