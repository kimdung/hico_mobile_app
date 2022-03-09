import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/register_controller.dart';

part 'register_extension.dart';

class RegisterScreen extends GetView<RegisterController> {
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
          'register'.tr,
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
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: Form(
              key: controller.registerForm,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: FCoreImage(
                        ImageConstants.appIcon,
                        fit: BoxFit.fill,
                        height: 51,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildUsername(),
                          const SizedBox(height: 20),
                          _buildPassword(),
                          const SizedBox(height: 20),
                          _buildConfirmPassword(),
                          const SizedBox(height: 40),
                          Text(
                            'register_notif'.tr,
                            style: TextAppStyle().secondTextStyle().copyWith(
                                  color: AppColor.fifthTextColorLight,
                                ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.termsOfUse();
                                  },
                                  child: Text(
                                    'term_and_conditions'.tr,
                                    style: TextAppStyle()
                                        .secondTextStyle()
                                        .copyWith(
                                          color: AppColor.primaryTextColorLight,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    'and'.tr,
                                    style: TextAppStyle()
                                        .secondTextStyle()
                                        .copyWith(
                                          color: AppColor.fifthTextColorLight,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.privatePolicy();
                                  },
                                  child: Text(
                                    'privacy_policy'.tr,
                                    style: TextAppStyle()
                                        .secondTextStyle()
                                        .copyWith(
                                          color: AppColor.primaryTextColorLight,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: CommonConstants.paddingDefault),
                            child: GeneralButton(
                              onPressed: () => controller.register(),
                              borderRadius: BorderRadius.circular(24),
                              borderColor: AppColor.primaryColorLight,
                              backgroundColor: AppColor.primaryColorLight,
                              child: Text(
                                'register'.tr,
                                style: TextAppStyle().titleButtonStyle(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
