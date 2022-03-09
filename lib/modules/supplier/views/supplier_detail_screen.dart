import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/user/documents_certificate_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/supplier_detail_controller.dart';

part 'supplier_detail_components.dart';

class SupplierDetailScreen extends GetView<SupplierDetailController> {
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
          'supplier.detail.title'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.paddingDefault),
            child: Column(
              children: [
                const SizedBox(height: 24),
                buildGeneralInfo(),
                const SizedBox(height: 29),
                buildItem(
                  icon: 'lib/resource/assets_resources/images/education.png',
                  title: 'profile.education'.tr,
                  description: controller.profile.value.education ?? '',
                ),
                const SizedBox(height: 8),
                buildItem(
                  icon: 'lib/resource/assets_resources/images/diploma.png',
                  title: 'profile.experience'.tr,
                  description: controller.profile.value.experience ?? '',
                ),
                const SizedBox(height: 12),
                buildImageGrid(
                  icon: 'lib/resource/assets_resources/images/certificate.png',
                  title: 'supplier.detail.degree'.tr,
                  list: controller.profile.value.files,
                ),
                const SizedBox(height: 38),
                GeneralButton(
                  onPressed: () {
                    controller.onBooking();
                  },
                  borderRadius: BorderRadius.circular(24),
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  child: Text(
                    'supplier.detail.booking'.tr,
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
}
