import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../controller/booking_detail_controller.dart';

part 'booking_detail_children.dart';

class BookingDetailScreen extends GetView<BookingDetailController> {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'booking.title'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildForm(
              Text(
                'booking.detail.order_infor'.tr,
                style: TextAppStyle().textOrderInforStyle(),
              ),
              IconConstants.syncRetry,
              'Hình thức',
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF27AE60),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: const Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'SVN-Jeko',
                  ),
                ),
              ),
              AppColor.textBlack,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            _buildForm(
              Text(
                'booking.detail.interpreters'.tr,
                style: TextAppStyle().textOrderInforStyle(),
              ),
              IconConstants.userTag,
              'Nguyễn Thuỳ Linh',
              const SizedBox(),
              AppColor.blueTextColor,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            _buildServiceInfor(),
            const SizedBox(
              height: 18.0,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            _buildForm(
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'booking.detail.time_work'.tr,
                    style: TextAppStyle().textOrderInforStyle(),
                  ),
                  Text(
                    '20/11/2021',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textBlack,
                      fontFamily: 'SVN-Jeko',
                    ),
                  ),
                ],
              ),
              IconConstants.documentHistory,
              '${controller.result.timeExtend} phút',
              const SizedBox(),
              AppColor.blueTextColor,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: 20.5,
                right: 20.5,
              ),
              minLeadingWidth: 18.0,
              leading: SvgPicture.asset(IconConstants.iconMoney),
              title: Text(
                'booking.detail.payment_method'.tr,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textBlack,
                  fontFamily: 'SVN-Jeko',
                ),
              ),
              subtitle: Text(
                'Thanh toán bằng ví',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textBlack,
                  fontFamily: 'SVN-Jeko',
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'SVN-Jeko',
                      fontWeight: FontWeight.w400,
                      color: AppColor.blueTextColor,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  SvgPicture.asset(
                    IconConstants.icArrowRight,
                    color: AppColor.blueColorLight,
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 4.0,
              color: AppColor.fourthTextColorLight.withOpacity(0.2),
            ),
            _buildIntoMoney(),
            const SizedBox(height: 34.0),
          ],
        ),
      ),
      bottomSheet: _buildExtendConfirmButton(),
    );
  }
}
