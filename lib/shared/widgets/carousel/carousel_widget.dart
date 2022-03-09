import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselItem {
  CarouselItem({
    this.image,
  });

  final String? image;
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
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
  }) : super(key: key);

  final String? title;
  final List<CarouselItem> items;
  final Function(int index)? onTapItem;
  final Widget? leading;
  final bool showLabel;
  final Function(String? url, int index)? imageBuilder;
  final double borderRadius;
  final BoxDecoration? decoration;
  final bool showIndicator;

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                widget.leading!
              ],
            ),
          ),
        (widget.items.isNotEmpty)
            ? CarouselSlider(
                items: List.generate(
                  widget.items.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: widget.decoration,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            child: imgBuild(widget.items[index].image, index),
                          );
                        }),
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
                  aspectRatio: 2.5,
                  onPageChanged: (index, _) {
                    setState(() {
                      currentIndex = index.toDouble();
                    });
                  },
                ),
              )
            : promotionsEmptyState,
        if (widget.showIndicator)
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DotsIndicator(
              dotsCount: widget.items.length,
              position: currentIndex,
              decorator: DotsDecorator(
                color: const Color(0xff333333).withOpacity(0.2),
                activeColor: const Color(0xffFF6B00),
                size: const Size.square(6),
                activeSize: const Size.square(6),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )
      ],
    );
  }

  Widget promotionsEmptyState = const Text('Empty');
}
