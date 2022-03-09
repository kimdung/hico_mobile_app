import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class ProfilePic extends StatelessWidget {
  final Function() onclick;
  final String fullName;
  final TextEditingController? textController;
  final bool? checkEditPhoneNumber;
  final Function()? editPhoneNumber;
  final bool? checkNotEdit;

  const ProfilePic({
    Key? key,
    required this.onclick,
    required this.fullName,
    this.textController,
    this.checkEditPhoneNumber = false,
    this.editPhoneNumber,
    this.checkNotEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: FCoreImage(
                      ImageConstants.bhMotoBanner,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: InkWell(
                      onTap: onclick,
                      child: FCoreImage(
                        IconConstants.CameraIcon,
                        height: 28,
                        width: 28,
                      ),
                    ),
                  )
                ],
              )),
          const SizedBox(height: 8),
          Container(
              alignment: Alignment.center,
              child: Text(fullName, style: TextAppStyle().textFullNameStyle())),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextAppStyle().textPhoneNumberStyle(),
                  enabled: checkEditPhoneNumber,
                  controller: textController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0)),
                ),
              ),
              checkNotEdit!
                  ? InkWell(
                      onTap: editPhoneNumber,
                      child: FCoreImage(IconConstants.IconEdit))
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
