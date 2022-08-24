import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/user/documents_certificate_model.dart';
import 'package:ui_api/models/user/services_model.dart';
import 'package:ui_api/models/user/time.dart';
import 'package:ui_api/models/user/user_time_model.dart';
import 'package:ui_api/models/user/workplaces_model.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../../shared/widget_hico/image_widget/network_image.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../call/pickup/picker_layout.dart';
import '../controllers/supplier_detail_controller.dart';

part 'supplier_detail_components.dart';

class BookingSupplierDetailScreen
    extends GetView<BookingSupplierDetailController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
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
                  buildListService(),
                  const SizedBox(height: 8),
                  buildItem(
                    icon: 'lib/resource/assets_resources/images/education.png',
                    title: 'profile.education'.tr,
                    description: controller.profile.value.education ?? '',
                  ),
                  const SizedBox(height: 8),
                  controller.profile.value.interExp != 0 &&
                          controller.profile.value.interExpDetail != null
                      ? buildItem(
                          icon:
                              'lib/resource/assets_resources/images/diploma.png',
                          title: 'supplier.detail.interpretation_experience'.tr,
                          description: interpretationExperiences[
                                  controller.profile.value.interExp!]
                              .content,
                          description2: controller.profile.value.interExpDetail,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 12),
                  controller.profile.value.transExp != 0 &&
                          controller.profile.value.transExpDetail != null
                      ? buildItem(
                          icon:
                              'lib/resource/assets_resources/images/diploma.png',
                          title: 'supplier.detail.translation_experience'.tr,
                          description: translatationExperiences[
                                  controller.profile.value.transExp!]
                              .content,
                          description2: controller.profile.value.transExpDetail,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 12),
                  buildImageGrid(
                    icon:
                        'lib/resource/assets_resources/images/certificate.png',
                    title: 'supplier.detail.degree'.tr,
                    list: controller.profile.value.files,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.profile.value.experience.toString(),
                    style: TextAppStyle().normalTextGrey(),
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
      ),
    );
  }
}
