import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/user/documents_certificate_model.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/profile_controller.dart';

part 'profile_extension.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
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
          'profile'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 14),
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(120)),
                  child: CachedNetworkImage(
                    width: 140,
                    height: 140,
                    imageUrl: AppDataGlobal.userInfo!.avatarImage!,
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
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final source =
                    await controller.imageWidget.showImageSource(context);
                if (source == null) {
                  return;
                }

                await controller.pickImage(source);
              },
              child: Text(
                'profile.edit_avatar'.tr,
                style: TextAppStyle().genaralTextStyle().copyWith(
                      color: AppColor.primaryTextColorLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE_UPDATE);
              },
              child: Text(
                'update',
                style: TextAppStyle().genaralTextStyle().copyWith(
                      color: AppColor.primaryTextColorLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 14),
            buildItem(
              icon: IconConstants.icProfile,
              title: 'profile.name'.tr,
              description: AppDataGlobal.userInfo!.name!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileGender,
              title: 'profile.gender'.tr,
              description:
                  AppDataGlobal.userInfo!.gender == CommonConstants.male
                      ? 'Nam'
                      : 'Nữ',
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileCalendar,
              title: 'profile.birthday'.tr,
              description: AppDataGlobal.userInfo!.dateOfBirth!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileEmail,
              title: 'Email',
              description: AppDataGlobal.userInfo!.email!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfilePhone,
              title: 'profile.phone'.tr,
              description: AppDataGlobal.userInfo!.phoneNumber!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileBank,
              title: 'profile.bank_info'.tr,
              description: AppDataGlobal.userInfo!.bankName!,
              description2: AppDataGlobal.userInfo!.bankBranchName!,
              description3: AppDataGlobal.userInfo!.bankAccountHolder!,
              description4: AppDataGlobal.userInfo!.bankAccountNumber!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileLocation,
              title: 'profile.address'.tr,
              description: AppDataGlobal.userInfo!.address!.code!,
              description2: AppDataGlobal.userInfo!.address!.provinceName!,
              description3: AppDataGlobal.userInfo!.address!.districtName!,
              description4: AppDataGlobal.userInfo!.address!.address!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileTrain,
              title: 'profile.station'.tr,
              description: AppDataGlobal.userInfo!.nearestStation!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileEducation,
              title: 'profile.education'.tr,
              description: AppDataGlobal.userInfo!.education!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileCertificate,
              title: 'profile.experience'.tr,
              description: AppDataGlobal.userInfo!.experience!,
            ),
            const SizedBox(height: 8),
            buildItem(
              icon: IconConstants.icProfileDiploma,
              title: 'profile.degree'.tr,
              description: AppDataGlobal.userInfo!.level!,
            ),
            const SizedBox(height: 12),
            buildImageList(
              title: 'profile.image_card'.tr,
              firstImage: AppDataGlobal.userInfo!.documentFrontSide!,
              firstImageTitle: 'profile.image_before'.tr,
              secondImage: AppDataGlobal.userInfo!.documentBackSide!,
              secondImageTitle: 'profile.image_after'.tr,
            ),
            const SizedBox(height: 12),
            buildImageGrid(
              title: 'profile.image_degree'.tr,
              list: AppDataGlobal.userInfo!.documentsCertificate,
            ),
            // buildImageList(
            //   title: 'profile.image_degree'.tr,
            //   //firstImage: ImageConstants.imageDemo,
            //   //secondImage: ImageConstants.imageDemo,
            // ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
