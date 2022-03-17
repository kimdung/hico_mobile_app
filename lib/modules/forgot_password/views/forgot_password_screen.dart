import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hico/data/app_data_global.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../controllers/forgot_password_controller.dart';

part 'forgot_password_extension.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child:
                    Center(child: Image.asset(ImageConstants.forgotPassword)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 68),
                child: Text(
                  'forgot_password.decription'.tr,
                  textAlign: TextAlign.center,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: AppColor.thirdTextColorLight,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Form(
                  key: controller.forgetGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: _buildUsername(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 121),
                        child: GeneralButton(
                          onPressed: () => controller.onForgot(),
                          borderRadius: BorderRadius.circular(24),
                          backgroundColor: AppColor.primaryColorLight,
                          borderColor: AppColor.primaryColorLight,
                          child: Text(
                            'send'.tr,
                            style: TextAppStyle().titleButtonStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
