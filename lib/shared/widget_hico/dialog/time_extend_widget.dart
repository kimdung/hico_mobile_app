import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../routes/app_pages.dart';
import '../../constants/colors.dart';
import '../../utils/dialog_util.dart';

class TimeExtendWidget extends StatelessWidget {
  const TimeExtendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          SvgPicture.asset(IconConstants.timeCircle),
          const SizedBox(
            height: 14.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Text(
              'Thời gian làm việc của bạn đã hết.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorLight,
                height: 1.65,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.5, right: 38.5),
            child: Text(
              'Bạn có muốn tiếp tục gia hạn thời gian làm việc không?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColor.textBlack,
                height: 1.65,
              ),
            ),
          ),
          const SizedBox(
            height: 23.0,
          ),
          SizedBox(
            width: DialogSize.FullWidth.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 44.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorLight,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(14.0)),
                      ),
                      child: const Text(
                        'Từ chối',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.TIME_EXTENSION);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 44.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorLight,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(14.0)),
                      ),
                      child: const Text(
                        'Gia Hạn',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
