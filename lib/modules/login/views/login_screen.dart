import 'dart:developer';

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
import '../controllers/login_controller.dart';

part 'login_extension.dart';

class LoginScreen extends GetView<LoginController> {
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
          'login'.tr,
          style: TextStyle(
            color: AppColor.thirdTextColorLight,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => SafeArea(
          child: GestureDetector(
            onTap: () {
              log('123');
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: controller.formLogin,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: FCoreImage(
                          ImageConstants.appLogo,
                          fit: BoxFit.fill,
                          height: 51,
                        ),
                      ),
                      const SizedBox(width: 66),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            _buildUsername(),
                            const SizedBox(height: 20),
                            _buildPassword(),
                            const SizedBox(height: 20),
                            Container(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () => controller.forgorPassword(),
                                child: Text(
                                  'forgot_password'.tr,
                                  style: TextAppStyle()
                                      .secondTextStyle()
                                      .copyWith(
                                          color:
                                              AppColor.primaryTextColorLight),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GeneralButton(
                              onPressed: () => controller.onLogin(),
                              borderRadius: BorderRadius.circular(24),
                              borderColor: AppColor.primaryColorLight,
                              backgroundColor: AppColor.primaryColorLight,
                              child: Text(
                                'login'.tr,
                                style: TextAppStyle().titleButtonStyle(),
                              ),
                            ),
                            const SizedBox(height: 28),
                            Row(
                              children: [
                                const Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  child: Text(
                                    'or'.tr,
                                    style: TextAppStyle().secondTextStyle(),
                                  ),
                                ),
                                const Expanded(child: Divider()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'login_with'.tr,
                                  style: TextAppStyle().secondTextStyle(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 83, vertical: 28),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildSocialBtn(controller.loginFB,
                                      ImageConstants.facebook),
                                  _buildSocialBtn(
                                    controller.loginLine,
                                    ImageConstants.line,
                                  ),
                                  _buildSocialBtn(controller.loginGG,
                                      ImageConstants.google),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'not_account'.tr,
                                    style: const TextStyle(
                                      color: Color(0xFF3B3B3B),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => controller.signin(),
                                  child: Text(
                                    'register'.tr,
                                    style: TextAppStyle()
                                        .genaralTextStyle()
                                        .copyWith(
                                          color: AppColor.primaryTextColorLight,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
