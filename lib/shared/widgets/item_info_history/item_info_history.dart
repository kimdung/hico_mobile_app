import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../expanded_section/expanded_section_widget.dart';
import '../image_widget/fcore_image.dart';

class ItemInformation extends StatefulWidget {
  final String title;
  final Widget data;

  ItemInformation({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  _ItemInformationState createState() => _ItemInformationState();
}

class _ItemInformationState extends State<ItemInformation>
    with SingleTickerProviderStateMixin {
  bool showDetail = true;
  @override
  void initState() {
    super.initState();
  }

  Widget itemInformation() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showDetail = !showDetail;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.title,
                        style: TextAppStyle().textTitleExpantedStyle()),
                  ),
                  FCoreImage(
                    showDetail ? IconConstants.icUp : IconConstants.icDown,
                  )
                ],
              ),
            ),
          ),
          ExpandedSection(
            childWidget: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: widget.data,
            ),
            expand: showDetail,
          ),
          Container(
            height: 1,
            color: const Color(0xff888888).withOpacity(0.2),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return itemInformation();
  }
}
