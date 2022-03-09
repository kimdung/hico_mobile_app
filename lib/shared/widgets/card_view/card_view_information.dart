import 'package:flutter/material.dart';
import '../../methods/common_method.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';
import 'card_view_common.dart';

class CardViewInformation extends StatelessWidget {
  final String titleCardView;
  final String imageBackground;
  final String titleDonor;
  final String content;
  final List<CardViewModel> lstItems;
  const CardViewInformation({
    required this.titleCardView,
    required this.lstItems,
    required this.imageBackground,
    required this.titleDonor,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FCoreImage(
                        imageBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 34, left: 10, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Text(titleCardView,
                                textAlign: TextAlign.center,
                                style:
                                    TextAppStyle().textTitleInformationStyle()),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lstItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    FCoreImage(
                                      lstItems[index].iconImage,
                                      fit: BoxFit.cover,
                                      height: 14,
                                      width: 14,
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.only(left: 7.0),
                                      child: Text(lstItems[index].itemName,
                                          style: TextAppStyle()
                                              .textItemformationStyle()),
                                    ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          lstItems[index].itemValue != ''
                                              ? Text(
                                                  formatD(lstItems[index]
                                                      .itemValue),
                                                  style: TextAppStyle()
                                                      .textValueformationStyle(),
                                                )
                                              : Container(),
                                          const SizedBox(width: 8),
                                          lstItems[index].iconImage != ''
                                              ? FCoreImage(
                                                  lstItems[index].iconImage,
                                                  fit: BoxFit.cover,
                                                  height: 14,
                                                  width: 14,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  ]),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 29),
              child: Column(
                children: [
                  Text(titleDonor,
                      style: TextAppStyle().textTitleDonorInformationStyle()),
                  const SizedBox(height: 6),
                  Text(content,
                      textAlign: TextAlign.center,
                      style: TextAppStyle().textContentDonorInformationStyle())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
