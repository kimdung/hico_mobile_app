import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class SliderCommon extends StatefulWidget {
  final List<Widget> lisItems;
  SliderCommon({Key? key, required this.lisItems}) : super(key: key);

  @override
  _SliderCommonState createState() => _SliderCommonState();
}

class _SliderCommonState extends State<SliderCommon> {
  double currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 5),
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: false,
                aspectRatio: 3.5,
                viewportFraction: 0.94,
                autoPlay: true,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index.toDouble();
                  });
                }),
            items: widget.lisItems,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DotsIndicator(
              dotsCount: widget.lisItems.length,
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
      ),
    );
  }
}
