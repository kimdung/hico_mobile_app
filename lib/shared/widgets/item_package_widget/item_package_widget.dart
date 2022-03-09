import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class ItemPackage extends StatelessWidget {
  final List<ItemPackageViewData> lstPackage;
  final int currentIndex;
  final Function(int) onButtonPressed;
  ItemPackage(
      {Key? key,
      required this.lstPackage,
      required this.currentIndex,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: Get.width,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => onButtonPressed(index),
              child: Container(
                height: 85,
                width: (Get.width - 32) / 3,
                child: Column(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: FCoreImage(
                      currentIndex == index
                          ? lstPackage[index].iconImageActive
                          : lstPackage[index].iconImage,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Text(lstPackage[index].value.tr,
                        style: currentIndex == index
                            ? TextAppStyle().textPackageActiveStyle()
                            : TextAppStyle().textPackageStyle()),
                  ),
                ]),
              ),
            );
          },
          itemCount: lstPackage.length,
        ));
  }
}

class ItemPackageViewData {
  final String iconImage;
  final String iconImageActive;
  final String value;
  ItemPackageViewData(this.iconImage, this.iconImageActive, this.value);
}
