import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/app_text_style.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../call/pickup/picker_layout.dart';
import '../controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: Scaffold(
        body: Obx(
          () => IndexedStack(
              index: controller.index.value, children: controller.tabs),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18), topLeft: Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
              child: BottomNavigationBar(
                  currentIndex: controller.index.value,
                  onTap: (int _index) => controller.changeIndex(_index),
                  selectedItemColor: AppColor.primaryTextColorLight,
                  unselectedItemColor: AppColor.menuTextColorLight,
                  selectedLabelStyle: TextAppStyle().bottomBarTextStyle(),
                  unselectedLabelStyle: TextAppStyle().bottomBarTextStyle(),
                  type: BottomNavigationBarType.fixed,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuHomeInact),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(
                          IconConstants.icMenuHomeAct,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      label: 'home.home'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuInvInact),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuInvAct),
                      ),
                      label: 'home.order'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Stack(
                          children: [
                            FCoreImage(IconConstants.icMenuNotifInact),
                            Positioned(
                              right:controller.totalNotif.value == 0 ? -5: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: controller.totalNotif.value == 0
                                        ? Colors.white
                                        : AppColor.primaryColorLight),
                                child: Center(
                                  child: Text(
                                    controller.totalNotif.value.toString(),
                                    style: AppTextStyle.secondTextStyle
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Stack(
                          children: [
                            FCoreImage(IconConstants.icMenuNotifAct),
                            Positioned(
                              right:controller.totalNotif.value == 0 ? -5: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: controller.totalNotif.value == 0
                                        ? Colors.white
                                        : AppColor.primaryColorLight),
                                child: Center(
                                  child: Text(
                                    controller.totalNotif.value.toString(),
                                    style: AppTextStyle.secondTextStyle
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      label: 'home.notification'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuNewsInact),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuNewsAct),
                      ), 
                      label: 'home.news'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuAccountInact),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FCoreImage(IconConstants.icMenuAccountAct),
                      ),
                      label: 'home.account'.tr,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
