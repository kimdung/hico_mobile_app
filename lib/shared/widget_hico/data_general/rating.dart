import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../box_decoration/box_decoration.dart';

class RatingsWidget extends StatefulWidget {
  const RatingsWidget({
    Key? key,
    this.currentStar,
  }) : super(key: key);

  final int? currentStar;
  @override
  State<RatingsWidget> createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'order.detail.rating'.tr,
            style: TextAppStyle().largeTextStype(),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.paddingDefault),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //all
                  TextItem(context, 0),
                  //5
                  StarItem(context, 5),
                  //4
                  StarItem(context, 4),
                  //3
                  StarItem(context, 3),
                  //2
                  StarItem(context, 2),
                  //1
                  StarItem(context, 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell TextItem(BuildContext context, double star) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, star);
      },
      child: BoxDecorationWidget(
        height: 52,
        border: Border(
          bottom: BorderSide(
            color: AppColor.borderGrayColorLight,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'all'.tr,
                style: TextAppStyle().smallTextBlack(),
              ),
              (widget.currentStar == null || star == widget.currentStar)
                  ? FCoreImage(
                      IconConstants.icSuccess,
                      width: 16,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell StarItem(BuildContext context, double star) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, star);
      },
      child: BoxDecorationWidget(
        height: 52,
        border: Border(
          bottom: BorderSide(
            color: AppColor.borderGrayColorLight,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                rating: star,
                itemBuilder: (context, index) =>
                    _image(IconConstants.icStarColor),
                itemCount: 5,
                itemSize: 40.0,
                unratedColor: Colors.grey.withAlpha(80),
                direction: Axis.horizontal,
              ),
              (star == widget.currentStar)
                  ? FCoreImage(
                      IconConstants.icSuccess,
                      width: 16,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 40,
      width: 40,
    );
  }
}
