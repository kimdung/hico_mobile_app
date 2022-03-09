import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class CardViewCommon extends StatelessWidget {
  final String titleCardView;
  final List<CardViewModel> lstItems;
  const CardViewCommon({
    Key? key,
    required this.titleCardView,
    required this.lstItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: const EdgeInsets.only(left: 11, right: 11, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(titleCardView, style: TextAppStyle().titleCardViewColorStyle()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: AppColor.dividerColorLight,
            height: 1,
          ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lstItems.length,
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FCoreImage(
                            lstItems[index].iconImage,
                            fit: BoxFit.cover,
                            height: 20,
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(left: 7.0),
                              child: Text(lstItems[index].itemName,
                                  style: TextAppStyle().titlePriceColorStyle()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(lstItems[index].itemValue,
                          textAlign: TextAlign.end,
                          style: TextAppStyle().titleCardViewColorStyle()),
                    )
                  ]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          )
        ],
      ),
    );
  }
}

class CardViewModel {
  final String itemName;
  final String itemValue;
  final String iconImage;
  CardViewModel(this.itemName, this.itemValue, this.iconImage);
}
