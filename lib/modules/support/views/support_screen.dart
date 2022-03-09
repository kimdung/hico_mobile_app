import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/support_controller.dart';

part 'support_extension.dart';

class SupportScreen extends GetView<SupportController> {
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
          'support'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColor.greyBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: FCoreImage(
                          IconConstants.icOrderCode,
                          width: 24,
                        )),
                    Expanded(
                      child: Text(
                        'support.title'.tr,
                        style: TextAppStyle().secondTextStyle().copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.supportForm,
                  child: Column(
                    children: [
                      _buildLabel(title: 'support.name'.tr, required: 1),
                      const SizedBox(height: 8),
                      _buildInputFullname(),
                      const SizedBox(height: 14),
                      _buildLabel(title: 'Email', required: 1),
                      const SizedBox(height: 8),
                      _buildInputEmail(),
                      const SizedBox(height: 14),
                      _buildLabel(title: 'support.phone'.tr, required: 1),
                      const SizedBox(height: 8),
                      _buildInputPhone(),
                      const SizedBox(height: 14),
                      _buildLabel(title: 'support.content'.tr, required: 1),
                      const SizedBox(height: 8),
                      _buildInputContent(),
                      const SizedBox(height: 30),
                      GeneralButton(
                        onPressed: () {
                          controller.send();
                        },
                        borderRadius: BorderRadius.circular(24),
                        borderColor: AppColor.primaryColorLight,
                        backgroundColor: AppColor.primaryColorLight,
                        child: Text(
                          'send'.tr,
                          style: TextAppStyle().titleButtonStyle(),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
