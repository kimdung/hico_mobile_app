import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../decoration/text_field_decoration.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../button/general_button.dart';

class TextDialogWidget extends StatelessWidget {
  const TextDialogWidget({
    Key? key,
    this.icon,
    this.title,
    this.height,
    this.titleBtn,
    this.hintText,
    this.titleWidget,
    this.padding,
  }) : super(key: key);
  final String? icon;
  final String? title;
  final double? height;
  final double? padding;
  final String? titleBtn;
  final String? hintText;
  final Widget? titleWidget;
  @override
  Widget build(BuildContext context) {
    var contents = '';
    return Container(
      height: height ?? 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                FCoreImage(
                  icon ?? IconConstants.icFail,
                  width: 32,
                ),
                const SizedBox(height: 5),
                titleWidget ?? Container(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                contents = value;
              },
              maxLines: 4,
              decoration: TextFieldDecoration.borderOutline(
                backgroundColor: AppColor.primaryBackgroundColorLight,
                borderColor: AppColor.sixTextColorLight,
                hintText: hintText,
                hintStype: TextAppStyle().smallTextGrey(),
                radius: 6,
              ),
              style: TextStyle(
                  color: AppColor.dividerColorLight,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400),
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
                    titleBtn ?? 'Từ chối',
                    style: TextAppStyle().normalTextWhite(),
                  ),
                ),
              ),
              const SizedBox(width: 1),
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  onPressed: () {
                    if (contents != '') {
                      Navigator.pop(context, contents);
                    }
                  },
                  child: Text(
                    titleBtn ?? 'Đồng ý',
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
