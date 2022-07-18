import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../call/pickup/picker_layout.dart';
import '/resource/assets_constant/images_constants.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/button/gradient_border_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/profile_controller.dart';

part 'profile_update_extension.dart';

class ProfileUpdateScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
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
            'profile.update'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              const SizedBox(height: 18),
              Obx(() => Container(
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          final source = await controller.imageWidget
                              .showImageSource(context);
                          if (source == null) {
                            return;
                          }
                          await controller.pickImage(source);
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(120)),
                          child: (controller.info.value.avatarImage != null)
                              ? NetWorkImage(
                                  image: controller.info.value.avatarImage!,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                )
                              : FCoreImage(
                                  ImageConstants.avatar,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  final source =
                      await controller.imageWidget.showImageSource(context);
                  if (source == null) return;
                  await controller.pickImage(source);
                },
                child: Text(
                  'profile.add_avatar'.tr,
                  style: TextAppStyle().smallTextPink(),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.formProfile,
                      child: Column(
                        children: [
                          //name
                          _buildLabel(title: 'support.name'.tr, required: 1),
                          const SizedBox(height: 8),
                          _buildInputFullname(),
                          //gender
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildLabel(
                                      title: 'profile.gender'.tr, required: 1)),
                              Expanded(
                                child: _buildInputRadio(),
                              )
                            ],
                          ),
                          //birthday
                          const SizedBox(height: 14),
                          _buildLabel(title: 'profile.birthday'.tr, required: 1),
                          const SizedBox(height: 8),
                          _buildInputBirthDay(context),
                          //email
                          const SizedBox(height: 14),
                          _buildLabel(title: 'Email', required: 1),
                          const SizedBox(height: 8),
                          _buildInputEmail(),
                          //phone
                          const SizedBox(height: 14),
                          _buildLabel(title: 'support.phone'.tr, required: 1),
                          const SizedBox(height: 8),
                          _buildInputPhone(),

                          Container(
                            child: Column(
                              children: [
                                _buildLabel(
                                    title: 'profile.update.address'.tr,
                                    required: 1),
                                //address
                                const SizedBox(height: 14),
                                _buildInputAddressCode(),
                                if (controller.showSuggest.value != 0)
                                  buildSuggestAddress(),
                                const SizedBox(height: 16),
                                _buildInputTemplate(
                                    textEditng: controller.province,
                                    focusNode: AlwaysDisabledFocusNode(),
                                    title: 'profile.update.provice'.tr),
                                const SizedBox(height: 16),
                                _buildInputTemplate(
                                    textEditng: controller.district,
                                    focusNode: AlwaysDisabledFocusNode(),
                                    title: 'profile.update.district'.tr),
                                const SizedBox(height: 16),
                                _buildInputTextArea(
                                    textEditng: controller.address,
                                    title: 'profile.update.address_block'.tr),
                              ],
                            ),
                          ),

                          //bank
                          const SizedBox(height: 14),
                          _buildLabel(
                              title: 'profile.update.bank'.tr, required: 1),
                          const SizedBox(height: 8),
                          buildSelectComponent(
                            title: controller.bankName.value != ''
                                ? controller.bankName.value
                                : 'profile.update.bank_name'.tr,
                            textColor: TextAppStyle().smallTextGrey(),
                            prefixIcon: true,
                            prefixImage:
                                'lib/resource/assets_resources/icons/keyboard_arrow_down_grey.png',
                            onPress: () => controller.getBank(context),
                          ),
                          //_buildInputBankName(),
                          const SizedBox(height: 16),
                          _buildInputBranchName(),
                          const SizedBox(height: 16),
                          _buildInputBankAccount(),
                          const SizedBox(height: 16),
                          _buildInputBankNumber(),
                          const SizedBox(height: 16),

                          //button
                          const SizedBox(height: 30),
                          GeneralButton(
                            onPressed: () {
                              controller.updateInfo();
                            },
                            borderRadius: BorderRadius.circular(24),
                            borderColor: AppColor.primaryColorLight,
                            backgroundColor: AppColor.primaryColorLight,
                            child: Text(
                              'profile.save'.tr,
                              style: TextAppStyle().titleButtonStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 30),
            ],
          ),
        )),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
