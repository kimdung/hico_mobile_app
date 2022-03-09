import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../../widget_hico/image_widget/network_image.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key? key,
    required this.image,
    this.title,
    this.width,
    this.height,
    this.shadowColor,
    this.padding = false,
    this.onPress,
    this.fit,
  }) : super(key: key);

  final String image;
  final String? title;
  final double? width;
  final BoxFit? fit;
  final double? height;
  final Color? shadowColor;
  final bool padding;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            width: width ?? double.infinity,
            margin: padding
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.all(0),
            height: height ?? 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color:
                      shadowColor ?? AppColor.secondColorLight.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: NetWorkImage(
                    image: image,
                    width: 48,
                    height: 48,
                    fit: fit,
                  ),
                ),
                const SizedBox(height: 7),
                if (title != null)
                  Text(
                    title!,
                    style: TextAppStyle().smallTextBlack(),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
