import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../resource/assets_constant/images_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/supplier_widget/supplier_widget.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/supplier_list_controller.dart';

part 'supplier_list_extension.dart';

class SupplierListScreen extends GetView<SupplierListController> {
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
          '${'supplier.title'.tr}',
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: Obx(
        () => (controller.suppliers.isNotEmpty)
            ? Container(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    buildFilter(context),
                    const SizedBox(height: 5),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.suppliers.length,
                        itemBuilder: (context, i) {
                          return SupplierWidget(
                            invoice: controller.suppliers[i],
                            onPress: () {
                              controller.viewDetail(
                                controller.suppliers[i],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonConstants.paddingDefault),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    FCoreImage(
                      ImageConstants.serviceEmpty,
                      width: 110,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: CommonConstants.paddingDefault),
                      child: Text('service.empty'.tr,
                          textAlign: TextAlign.center,
                          style: TextAppStyle().genaralTextStyle()),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
