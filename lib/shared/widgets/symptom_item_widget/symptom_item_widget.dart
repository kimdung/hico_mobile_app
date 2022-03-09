import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class SymptomItem extends StatelessWidget {
  final List<String> lstItem;
  final bool isRequired;
  final bool isNotEmpty;
  final Function(int) onAdd;
  SymptomItem(
      {Key? key,
      required this.lstItem,
      this.isRequired = true,
      this.isNotEmpty = true,
      required this.onAdd})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List<Widget>.generate(lstItem.length, (index) {
          return InkWell(
            onTap: () => onAdd(index),
            child: Container(
              decoration: BoxDecoration(
                color: isRequired
                    ? AppColor.eightTextColorLight.withOpacity(0.1)
                    : AppColor.eightTextColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(lstItem[index],
                      style: isRequired
                          ? TextAppStyle().textTitleExpantedStyle()
                          : TextAppStyle().textNotificationExpiryStyle()),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    child: isNotEmpty
                        ? isRequired
                            ? Icon(
                                Icons.add,
                                color: AppColor.eightTextColorLight,
                              )
                            : FCoreImage(IconConstants.iconCLose,
                                color: AppColor.secondTextColorLight)
                        : null,
                  ),
                ],
              ),
            ),
          );

          // FilterChip(
          //   avatar: isNotEmpty
          //       ? isRequired
          //           ? Icon(
          //               Icons.add,
          //               color: AppColor.eightTextColorLight,
          //             )
          //           : FCoreImage(IconConstants.iconCLose,
          //               color: AppColor.secondTextColorLight)
          //       : null,
          //   labelPadding: isRequired
          //       ? const EdgeInsets.symmetric(vertical: 4, horizontal: 4)
          //       : const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          //   label: Text(lstItem[index],
          //       style: isRequired
          //           ? TextAppStyle().textTitleExpantedStyle()
          //           : TextAppStyle().textNotificationExpiryStyle()),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   backgroundColor: isRequired
          //       ? AppColor.eightTextColorLight.withOpacity(0.1)
          //       : AppColor.eightTextColorLight,
          //   onSelected: onAdd(index),
          // );
        }));
  }
}
