import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class NotificationMedical extends StatefulWidget {
  final bool background;
  final String hospitalCalendar;
  const NotificationMedical(
      {Key? key, this.background = true, required this.hospitalCalendar});

  @override
  _NotificationMedicalState createState() => _NotificationMedicalState();
}

class _NotificationMedicalState extends State<NotificationMedical> {
  bool remoteNoti = true;
  @override
  Widget build(BuildContext context) {
    return remoteNoti
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: widget.background
                  ? Colors.white
                  : AppColor.eightTextColorLight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        FCoreImage(
                          IconConstants.IconNotificationMedical,
                          color: widget.background
                              ? AppColor.eightTextColorLight
                              : Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Thông báo',
                          textAlign: TextAlign.left,
                          style: widget.background
                              ? TextAppStyle().textTitleNotitStyle()
                              : TextAppStyle().textTitleNotitNotActiveStyle(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              remoteNoti = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: FCoreImage(
                              IconConstants.IconMedicalDelete,
                              color: widget.background
                                  ? AppColor.primaryTextColorLight
                                  : Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: widget.background
                      ? AppColor.dividerColorLightListBank
                      : Colors.white,
                ),
                const SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Bạn có một lịch hẹn khám tại ',
                        style: widget.background
                            ? TextAppStyle().textServicePackageTitleStyle()
                            : TextAppStyle().textNumberMembershipCardStyle(),
                      ),
                      TextSpan(
                          text: widget.hospitalCalendar,
                          style: widget.background
                              ? TextAppStyle().textTitleContactStyle()
                              : TextAppStyle().textNumberMembershipCardStyle()),
                    ],
                  ),
                )
// Text(
//                   ,
//                 ),
              ],
            ))
        : Container();
  }
}
