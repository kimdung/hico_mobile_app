import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/services_widget/service_item.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: AppColor.secondBackgroundColorLight,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: CommonConstants.paddingDefault),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryBackgroundColorLight,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: AppColor.primaryColorLight)),
                          child: TextField(
                            onSubmitted: (value) {
                              controller.search();
                            },
                            style: TextAppStyle().genaralTextStyle(),
                            cursorColor: AppColor.fifthTextColorLight,
                            controller: controller.keyword,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'service.category.search_field'.tr,
                                hintStyle: TextAppStyle().genaralTextStyle(),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      controller.search();
                                    },
                                    child: Image.asset(IconConstants.icSearch)),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 7)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: Get.back,
                        child: Text(
                          'Thoát',
                          style: TextAppStyle()
                              .smallTextPink()
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
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
                                  image: controller
                                      .serviceList[index].displayImage!,
                                  title: controller.serviceList[index].name!,
                                  shadowColor: AppColor.dividerColorLight
                                      .withOpacity(0.2),
                                  fit: BoxFit.cover,
                                  onPress: () {
                                    controller.viewService(
                                        controller.serviceList[index]);
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
        ),
      ),
    );
  }
}
