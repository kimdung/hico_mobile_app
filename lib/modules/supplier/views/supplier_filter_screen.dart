import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../../shared/widget_hico/box_decoration/box_decoration.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/supplier_filter_controller.dart';

part 'supplier_filter_components.dart';

class SupplierFilterScreen extends GetView<SupplierFilterController> {
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
            'supplier.filter.title_bar'.tr,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: Container(
          child: Column(
            children: [
              buildNoteSection(),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: CommonConstants.paddingDefault),
                      child: Column(
                        children: [
                          buildDateComponent(
                            onPress: () {
                              controller.selectFromDate(context);
                            },
                            date: controller.date,
                            hintText:
                                DateFormatter.formatDate(controller.fromDate),
                          ),
                          const SizedBox(height: 24),
                          // buildTitleComponent(
                          //   title: 'supplier.filter.time_slot'.tr,
                          // ),
                          // const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: buildBoxTimeSection(
                                  onPress: () {
                                    controller.showTimeFrom(context);
                                  },
                                  title: 'supplier.filter.from'.tr,
                                  value: controller.fromTime.value,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: CommonConstants.paddingDefault),
                                child: SizedBox(
                                  width: 12,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: buildBoxTimeSection(
                                  onPress: () {
                                    controller.showTimeTo(context);
                                  },
                                  alignment: MainAxisAlignment.end,
                                  title: 'supplier.filter.to'.tr,
                                  value: controller.toTime.value,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 3, // 100,
                                child: buildTitleComponent(
                                  title: 'supplier.filter.online'.tr,
                                  prefixIcon: false,
                                  alignment: Alignment.center,
                                ),
                              ),
                              buildRadioComponent(type: CommonConstants.online),
                              buildRadioComponent(
                                  type: CommonConstants.offline),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Container(
                            child: controller.isOnline.value ==
                                    CommonConstants.offline
                                ? Column(
                                    children: [
                                      buildTitleComponent(
                                        title: 'supplier.filter.location'.tr,
                                      ),
                                      const SizedBox(height: 14),
                                      buildSelectComponent(
                                        title: controller.province.value != ''
                                            ? controller.province.value
                                            : 'supplier.filter.provice'.tr,
                                        textColor: controller.province.value !=
                                                ''
                                            ? TextAppStyle().smallTextBlack()
                                            : TextAppStyle().smallTextGrey(),
                                        onPress: () =>
                                            controller.getProvince(context),
                                      ),
                                      const SizedBox(height: 8),
                                      buildSelectComponent(
                                        title: controller.district.value != ''
                                            ? controller.district.value
                                            : 'supplier.filter.district'.tr,
                                        textColor: controller.district.value !=
                                                ''
                                            ? TextAppStyle().smallTextBlack()
                                            : TextAppStyle().smallTextGrey(),
                                        onPress: () =>
                                            controller.getDistricts(context),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          const SizedBox(height: 24),
                          buildSelectComponent(
                            title: controller.level.value != ''
                                ? controller.level.value
                                : 'supplier.filter.level'.tr,
                            height: 47,
                            prefixIcon: true,
                            shadow: true,
                            border: false,
                            textColor: TextAppStyle().normalTextPink(),
                            padding: 14,
                            onPress: () => controller.getLevel(context),
                          ),
                          const SizedBox(height: 24),
                          buildStarComponent(
                            title: controller.star.value != 0
                                ? RatingBarIndicator(
                                    rating: controller.request.filterNumberStar!
                                        .toDouble(),
                                    itemBuilder: (context, index) =>
                                        _image(IconConstants.icStarColor),
                                    itemCount: 5,
                                    itemSize: 40.0,
                                    unratedColor: Colors.grey.withAlpha(80),
                                    direction: Axis.horizontal,
                                  )
                                : Text(
                                    'supplier.filter.rating'.tr,
                                    style: TextAppStyle().normalTextPink(),
                                  ),
                            onPress: () => controller.getRating(context),
                          ),
                          const SizedBox(height: 60),
                          GeneralButton(
                            onPressed: () => controller.search(),
                            borderRadius: BorderRadius.circular(24),
                            borderColor: AppColor.primaryColorLight,
                            backgroundColor: AppColor.primaryColorLight,
                            child: Text(
                              'supplier.filter.search'.tr,
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
            ],
          ),
        ),
      ),
    );
  }
}
