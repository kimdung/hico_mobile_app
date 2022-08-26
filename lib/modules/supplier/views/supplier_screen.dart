import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/supplier_widget/supplier_widget.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/supplier_controller.dart';

part 'supplier_components.dart';

class SupplierScreen extends GetView<SupplierController> {
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
            '${'supplier.title'.tr}: ${controller.bookingPrepare.service?.name ?? ''}',
            style: TextAppStyle().titleAppBarStyle(),
          ),
          elevation: 4,
          backgroundColor: Colors.white,
          shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
        ),
        body: SingleChildScrollView(
          child: Obx(() => Container(
                child: Column(
                  children: [
                    // const SizedBox(height: 24),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: CommonConstants.paddingDefault),
                    //   padding: const EdgeInsets.symmetric(horizontal: 14),
                    //   width: Get.width,
                    //   height: 44,
                    //   decoration: BoxDecoration(
                    //     color: AppColor.secondBackgroundColorLight,
                    //     borderRadius: BorderRadius.circular(40),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //           child: Text(
                    //         'supplier.filter'.tr,
                    //         style: TextAppStyle().normalTextGrey(),
                    //       )),
                    //       InkWell(
                    //           onTap: () {
                    //             Navigator.pop(context);
                    //           },
                    //           child: FCoreImage(IconConstants.icFilterPink))
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 29),
                    (controller.suppliers.isNotEmpty)
                        ? Container(
                            child: Column(
                              children: [
                                ...List.generate(
                                    controller.suppliers.length,
                                    (index) => SupplierWidget(
                                          invoice: controller.suppliers[index],
                                          onPress: () {
                                            controller.viewDetail(
                                                controller.suppliers[index]);
                                          },
                                          onPressButton: () {
                                            controller.onBooking(
                                                controller.suppliers[index]);
                                          },
                                        ))
                              ],
                            ),
                          )
                        : Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 80),
                                FCoreImage(
                                  ImageConstants.filterEmpty,
                                  width: 110,
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 58),
                                  child: Text('service.empty'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextAppStyle().genaralTextStyle()),
                                ),
                                const SizedBox(height: 80),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          CommonConstants.paddingDefault),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'supplier.filter.suggestion'.tr,
                                    textAlign: TextAlign.left,
                                    style: TextAppStyle()
                                        .normalTextStype()
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                                ...List.generate(
                                  controller.suppliersOther.length,
                                  (i) => SupplierWidget(
                                    invoice: controller.suppliersOther[i],
                                    onPress: () {
                                      controller.viewSupplierDetail(
                                        controller.suppliersOther[i],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
