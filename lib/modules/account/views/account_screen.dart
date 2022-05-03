import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/account_controller.dart';

part 'account_extension.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  final AccountController controller;
  AccountScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'account'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 14),
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                    child: CachedNetworkImage(
                      width: 140,
                      height: 140,
                      imageUrl: controller.info.value.avatarImage!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.info.value.name!,
                  style: TextAppStyle().largeTextStype(),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfile,
                  title: 'profile'.tr,
                  onPress: () {
                    controller.updateInfo();
                  },
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileStatistic,
                  title: 'statistic'.tr,
                  onPress: () => Get.toNamed(Routes.STATISTIC),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileSetting,
                  title: 'setting'.tr,
                  onPress: () => Get.toNamed(Routes.CONFIG),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfilePass,
                  title: 'change_password'.tr,
                  onPress: () => Get.toNamed(Routes.CHANGE_PASS),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileContact,
                  title: 'contact'.tr,
                  onPress: () => Get.toNamed(Routes.CONTACT),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileBank,
                  title: 'bank_info'.tr,
                  onPress: () => Get.toNamed(Routes.BANK),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfilePolicy,
                  title: 'payment_policy'.tr,
                  onPress: () => Get.toNamed(Routes.PAYMENT_POLICY),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileSupport,
                  title: 'support'.tr,
                  onPress: () => Get.toNamed(Routes.SUPPORT),
                ),
                const SizedBox(height: 14),
                buildItem(
                  icon: IconConstants.icProfileLogout,
                  title: 'logout'.tr,
                  titleColor: AppColor.primaryTextColorLight,
                  allowArrow: 0,
                  onPress: () {
                    controller.onLogout();
                  },
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
