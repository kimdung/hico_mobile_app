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
import '../controllers/config_controller.dart';

class ChangePassScreen extends GetView<ConfigController> {
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
          'change_password'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: Get.height,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(child: Image.asset(ImageConstants.forgotPasswordChange)),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92),
                  child: Text(
                    'change_pass_title'.tr,
                    textAlign: TextAlign.center,
                    style: TextAppStyle().normalTextStype(),
                  ),
                ),
                Form(
                  key: controller.changePassForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 14),
                      _buildOldPassword(),
                      const SizedBox(height: 4),
                      _buildPassword(),
                      const SizedBox(height: 4),
                      _buildConfirmPassword(),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                GeneralButton(
                  onPressed: () => controller.changePassword(),
                  borderRadius: BorderRadius.circular(24),
                  backgroundColor: AppColor.primaryColorLight,
                  borderColor: AppColor.primaryColorLight,
                  child: Text(
                    'confirm'.tr,
                    style: TextAppStyle().titleButtonStyle(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOldPassword() {
    return TextFormField(
      controller: controller.oldPasswordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      obscureText: !controller.showPassword,
      cursorColor: AppColor.fifthTextColorLight,
      style: TextAppStyle().normalTextGrey(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' ${'old_pass'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        prefixIcon: Container(
          margin: const EdgeInsets.only(right: 12),
          child: FCoreImage(
            IconConstants.icKey,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: controller.newsPasswordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.fifthTextColorLight,
      keyboardType: TextInputType.text,
      obscureText: !controller.showPassword,
      style: TextAppStyle().normalTextGrey(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' ${'new_pass'.tr}',
        hintStype: TextAppStyle().normalTextGrey(),
        prefixIcon: Container(
          margin: const EdgeInsets.only(right: 12),
          child: FCoreImage(
            IconConstants.icKey,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
        controller: controller.confirmPasswordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.fifthTextColorLight,
        obscureText: !controller.showPassword,
        style: TextAppStyle().normalTextGrey(),
        decoration: TextFieldDecoration.borderLogin(
          backgroundColor: AppColor.primaryBackgroundColorLight,
          borderColor: AppColor.dividerColorLight,
          hintText: ' ${'confirm_new_pass'.tr}',
          hintStype: TextAppStyle().normalTextGrey(),
          prefixIcon: Container(
            margin: const EdgeInsets.only(right: 12),
            child: FCoreImage(
              IconConstants.icKey,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'data_requied'.tr;
          }
          if (value != controller.newsPasswordController.text) {
            return 'data_not_match'.tr;
          }
        });
  }
}
