import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class ItemServiceDoctor extends StatelessWidget {
  final List<ItemOnlineModel> lstItems;
  final int currentIndex;
  final Function(int) onButtonPressed;
  ItemServiceDoctor(
      {Key? key,
      required this.lstItems,
      required this.currentIndex,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: 16,
      spacing: 16,
      children: List<Widget>.generate(
        lstItems.length,
        (index) {
          return InkWell(
            onTap: () => onButtonPressed(index),
            child: Container(
              width: (Get.width - 48) / 2,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColor.eightTextColorLight.withOpacity(0.1)
                    : Colors.white,
                border: Border.all(
                    color: currentIndex == index
                        ? AppColor.eightTextColorLight.withOpacity(0.5)
                        : Colors.white, // Set border color
                    width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        FCoreImage(
                          lstItems[index].iamge,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(lstItems[index].title,
                            textAlign: TextAlign.center,
                            style: TextAppStyle().textPhoneNumberStyle()),
                      ]))),
            ),
          );
        },
      ),
    );
  }
}

class ItemOnlineModel {
  final String iamge;
  final String title;
  ItemOnlineModel(this.iamge, this.title);
}
