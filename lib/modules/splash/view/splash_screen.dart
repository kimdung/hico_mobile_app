import 'package:flutter/material.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColorLight,
      body: Stack(
        children: [
          Center(
            child: FCoreImage(
              ImageConstants.appLogo,
              height: 64,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: FCoreImage(
              ImageConstants.appLogo,
              height: 64,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
