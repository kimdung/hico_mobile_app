import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hico/shared/widget_hico/image_widget/network_image.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class SliderItem {
  SliderItem({
    this.title,
    this.description,
    required this.image,
    this.onpress,
  });

  final String image;
  final String? title, description;
  Function()? onpress;

}

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    required this.items,
    Key? key,
    this.title,
    this.showLabel = false,
    this.onTapItem,
    this.leading,
    this.imageBuilder,
    this.borderRadius = 8,
    this.decoration,
    this.showIndicator = true,
    this.ratio,
    this.localImage = true,
  }) : super(key: key);

  final String? title;
  final List<SliderItem> items;
  final Function(int index)? onTapItem;
  final Widget? leading;
  final bool showLabel;
  final Function(String? url, int index)? imageBuilder;
  final double borderRadius;
  final BoxDecoration? decoration;
  final bool showIndicator;
  final double? ratio;
  final bool localImage;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget imgBuild(String? url, int i) {
      if (widget.imageBuilder == null) {
        return Image.network(url!);
      } else {
        return widget.imageBuilder!(url, i);
      }
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.items.isNotEmpty)
            CarouselSlider(
              items: List.generate(
                widget.items.length,
                (index) {
                  return InkWell(
                    onTap: widget.items[index].onpress,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: widget.localImage
                                ? const EdgeInsets.all(0)
                                : const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                            width: double.infinity,
                            decoration: widget.decoration,
                            child: widget.localImage
                                ? FCoreImage(
                                    widget.items[index].image,
                                  )
                                : NetWorkImage(
                                    image: widget.items[index].image,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          if (widget.items[index].title != null)
                            Text(
                              widget.items[index].title!,
                              style: TextAppStyle().titleBoldStyle(),
                            ),
                          if (widget.items[index].description != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                widget.items[index].description!,
                                textAlign: TextAlign.center,
                                style: TextAppStyle().genaralTextStyle(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: false,
                aspectRatio: widget.ratio ?? 1.2,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index.toDouble();
                  });
                },
              ),
            )
          else
            promotionsEmptyState,
          if (widget.showIndicator)
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DotsIndicator(
                dotsCount: widget.items.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: const Color(0xffFFBED2),
                  activeColor: const Color(0xffFF5D8F),
                  size: const Size.square(12),
                  activeSize: const Size.square(12),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget promotionsEmptyState = const Text('Empty');
}
