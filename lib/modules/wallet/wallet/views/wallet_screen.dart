import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget_hico/button/general_button.dart';
import '../../../call/pickup/picker_layout.dart';
import '../../topup/controllers/topup_controller.dart';
import '../../topup/views/topup_view.dart';
import '../../topup_history/controllers/topup_history_controller.dart';
import '../../topup_history/views/topup_history_view.dart';
import '../controllers/wallet_controller.dart';

class WalletScreen extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      controller.callMethods,
      scaffold: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: SvgPicture.asset(IconConstants.icBack, width: 11),
              onPressed: Get.back,
            ),
            title: Text(
              'topup'.tr,
              style: TextAppStyle().titleAppBarStyle(),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
          ),
          body: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildStatusNavBar(),
        Expanded(
          child: Obx(
            () => controller.indexPage.value == 0
                ? TopupView(TopupController(controller.isOrder))
                : TopupHistoryView(TopupHistoryController(controller)),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusNavBar() { 
    return Container(
      height: 44,
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      decoration: BoxDecoration(
        color: AppColor.secondBackgroundColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(48)),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.indexPage.value = 0;
                },
                child: Container(
                  // height: 44,
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: (controller.indexPage.value == 0)
                      ? BoxDecoration(
                          color: AppColor.primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(48)),
                        )
                      : null,
                  child: Text(
                    'topup.title'.tr,
                    textAlign: TextAlign.center,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: controller.indexPage.value == 0
                              ? AppColor.secondTextColorLight
                              : AppColor.primaryTextColorLight,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.indexPage.value = 1;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: controller.indexPage.value == 1
                      ? BoxDecoration(
                          color: AppColor.primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(48)),
                        )
                      : null,
                  child: Text(
                    'topup.history'.tr,
                    textAlign: TextAlign.center,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: controller.indexPage.value == 1
                              ? AppColor.secondTextColorLight
                              : AppColor.primaryTextColorLight,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
