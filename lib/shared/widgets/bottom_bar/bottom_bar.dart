import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/resource/assets_constant/icon_constants.dart';
import 'package:hico/routes/app_pages.dart';
import 'package:hico/shared/constants/colors.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    this.tabIndex = 0,
  }) : super(key: key);

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FCoreImage(tabIndex == 0
                    ? IconConstants.icMenuInvAct
                    : IconConstants.icMenuInvInact),
                Text(
                  'Đơn hàng',
                  style: TextAppStyle().bottomBarTextStyle().copyWith(
                        color: tabIndex == 0
                            ? AppColor.primaryTextColorLight
                            : AppColor.menuTextColorLight,
                      ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FCoreImage(tabIndex == 1
                    ? IconConstants.icMenuNotifAct
                    : IconConstants.icMenuNotifInact),
                Text(
                  'Thông báo',
                  style: TextAppStyle().bottomBarTextStyle().copyWith(
                        color: tabIndex == 1
                            ? AppColor.primaryTextColorLight
                            : AppColor.menuTextColorLight,
                      ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.NEWS);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FCoreImage(tabIndex == 2
                    ? IconConstants.icMenuNewsAct
                    : IconConstants.icMenuNewsInact),
                Text(
                  'Tin tức',
                  style: TextAppStyle().bottomBarTextStyle().copyWith(
                        color: tabIndex == 2
                            ? AppColor.primaryTextColorLight
                            : AppColor.menuTextColorLight,
                      ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.ACCOUNT);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FCoreImage(tabIndex == 3
                    ? IconConstants.icMenuAccountAct
                    : IconConstants.icMenuAccountInact),
                Text(
                  'Tài khoản',
                  style: TextAppStyle().bottomBarTextStyle().copyWith(
                        color: tabIndex == 3
                            ? AppColor.primaryTextColorLight
                            : AppColor.menuTextColorLight,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
