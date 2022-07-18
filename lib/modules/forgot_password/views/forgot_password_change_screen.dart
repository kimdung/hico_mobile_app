import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/forgot_password_controller.dart';

//part 'forgot_password_extension.dart';

class ForgotPasswordChangeScreen extends GetView<ForgotPasswordController> {
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
        child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                      child: Image.asset(ImageConstants.forgotPasswordChange)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92),
                  child: Text(
                    'forgot_password.new_description'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.thirdTextColorLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Form(
                    key: controller.forgetChangeGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: _buildPassword(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _buildConfirmPassword(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 94),
                          child: GeneralButton(
                            onPressed: () => controller.onChange(),
                            borderRadius: BorderRadius.circular(24),
                            backgroundColor: AppColor.primaryColorLight,
                            borderColor: AppColor.primaryColorLight,
                            child: Text(
                              'forgot_password.recovery'.tr,
                              style: TextStyle(
                                  color: AppColor.secondTextColorLight,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
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
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: controller.passwordController,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !controller.showPassword,
      cursorColor: AppColor.fifthTextColorLight,
      style: TextAppStyle().normalTextGrey(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: 'new_pass'.tr,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: FCoreImage(
            IconConstants.icKey,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'enter_new_pass'.tr : null,
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
        controller: controller.confirmPasswordController,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: !controller.showPassword,
        cursorColor: AppColor.fifthTextColorLight,
        style: TextAppStyle().normalTextGrey(),
        decoration: TextFieldDecoration.borderLogin(
          backgroundColor: AppColor.primaryBackgroundColorLight,
          borderColor: AppColor.dividerColorLight,
          hintText: 'confirm_new_pass'.tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: FCoreImage(
              IconConstants.icKey,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'incorrect_confirm_pass'.tr;
          }
          if (value != controller.passwordController.text) {
            return 'incorrect_confirm_pass'.tr;
          }
        });
  }
}
