import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hico/data/app_data_global.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/register_controller.dart';

class RegisterOtpScreen extends GetView<RegisterController> {
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
          'register_otp'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Container(
              width: Get.width,
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: FCoreImage(
                      ImageConstants.appLogo,
                      fit: BoxFit.fill,
                      height: 51,
                    ),
                  ),
                  const SizedBox(height: 42),
                  Text(
                    'register.comfirm'.tr,
                    style: TextAppStyle().largeTextPink(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'register.comfirm_email'.tr,
                      style: TextAppStyle().normalTextGrey(),
                    ),
                  ),
                  Text(
                    controller.emailHidden.value,
                    style: TextAppStyle().normalTextPink(),
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
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 48,
                        fieldWidth: 48,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
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
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        // call api check otp
                        controller.confirmOtp(v);
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
                          style: TextAppStyle().smallTextGrey(),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                            onTap: () {
                              controller.resendOtp();
                            },
                            child: Text('register.resend'.tr)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(
                      '${'register.contact'.tr}: ${AppDataGlobal.masterData!.supportEmail}',
                      style: TextAppStyle().normalTextPink(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
