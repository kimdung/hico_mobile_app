import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hico/modules/on_boarding/controller/on_boarding_controller.dart';
import 'package:hico/shared/widgets/carousel/slider_widget.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/app_pages.dart';
import '../../constants/colors.dart';
import '../carousel/carousel_widget.dart';
import '../image_widget/fcore_image.dart';

class AppBarSlider extends StatelessWidget {
  final List<String?> promotions;
  const AppBarSlider({Key? key, required this.promotions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 150, color: AppColor.appbarSliderColor),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: buildPromotions(promotions),
        )
      ],
    );
  }
}

Widget buildPromotions(List<String?> promotions) {
  if (promotions.isNotEmpty) {
    return CarouselWidget(
      showIndicator: true,
      items: promotions
          .map((e) => CarouselItem(
                image: ImageConstants.sliderDemo,
              ))
          .toList(),
      imageBuilder: (String? url, int index) {
        return LayoutBuilder(builder: (
          context,
          BoxConstraints boxConstraints,
        ) {
          const color = Colors.transparent;

          return InkWell(
            onTap: () {
              // Get.toNamed(Routes.MEMBERSHIP_CARD_SCREEN);
            },
            child: Container(
              width: boxConstraints.maxWidth - 32,
              height: boxConstraints.maxHeight,
              color: color,
              child: FCoreImage(
                url ?? ImageConstants.recueMotoImage,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
      },
    );
  }
  return Container();
}

Widget buildSlider(List<SliderModel> promotions) {
  if (promotions.isNotEmpty) {
    return Container(
      child: SliderWidget(
        showIndicator: true,
        items: promotions
            .map((e) => SliderItem(
                  image: e.image!,
                  title: e.title ?? '',
                  description: e.description ?? '',
                ))
            .toList(),
      ),
    );
  }
  return Container();
}
