import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';

import '../../constants/colors.dart';

class NetWorkImage extends StatelessWidget {
  const NetWorkImage({
    Key? key,
    required this.image,
    this.fit,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height ?? 48,
      
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      //placeholder: (context, url) => const CircularProgressIndicator(),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryColorLight,
          strokeWidth: 2,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
