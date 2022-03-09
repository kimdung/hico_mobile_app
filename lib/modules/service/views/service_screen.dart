import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/services_widget/service_item.dart';
import '../controllers/service_controller.dart';

class ServiceScreen extends GetView<ServiceController> {
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
          'service.category.title_bar'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: AppColor.appbarColorLight.withOpacity(0.8),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              width: Get.width,
              height: 44,
              decoration: BoxDecoration(
                color: AppColor.secondBackgroundColorLight,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onSubmitted: (value) {
                  controller.search(value);
                },
                style: TextAppStyle().genaralTextStyle(),
                cursorColor: AppColor.fifthTextColorLight,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'service.category.search_field'.tr,
                    hintStyle: TextAppStyle().genaralTextStyle(),
                    prefixIcon: Image.asset(IconConstants.icSearch),
                    contentPadding: const EdgeInsets.symmetric(vertical: 7)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() => Container(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CommonConstants.paddingDefault,
                            vertical: 4),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 24,
                        childAspectRatio: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          ...List.generate(
                            controller.serviceList.length,
                            (index) => ServiceItem(
                              image:
                                  controller.serviceList[index].displayImage!,
                              title: controller.serviceList[index].name!,
                              shadowColor:
                                  AppColor.dividerColorLight.withOpacity(0.2),
                              fit: BoxFit.cover,
                              onPress: () {
                                controller
                                    .viewService(controller.serviceList[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
