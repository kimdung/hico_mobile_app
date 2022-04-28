import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../button/general_button.dart';

class OrderExrendWidget extends StatelessWidget {
  const OrderExrendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                FCoreImage(IconConstants.timeCircle),
                const SizedBox(height: 14),
                Text(
                  'Thời gian làm việc của bạn đã hết.',
                  textAlign: TextAlign.center,
                  style: TextAppStyle().largeTextStype(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bạn có muốn tiếp tục gia hạn thời gian làm việc không?',
                  textAlign: TextAlign.center,
                  style: TextAppStyle().normalTextGrey(),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Từ chối',
                    style: TextAppStyle().normalTextWhite(),
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(1);
                  },
                  child: Text(
                    'Gia Hạn',
                    style: TextAppStyle().normalTextWhite(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
