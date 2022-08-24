import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';

class SortOrderWidget extends StatefulWidget {
  const SortOrderWidget({
    Key? key,
    this.currentID,
  }) : super(key: key);

  final int? currentID;

  @override
  State<SortOrderWidget> createState() => _SortOrderWidgetState();
}

class _SortOrderWidgetState extends State<SortOrderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Xếp theo',
            style: TextAppStyle().normalTextPink(),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  buildItem(
                    title: SortType.PriceAsc.name,
                    id: SortType.PriceAsc.id,
                    currentId: widget.currentID ?? 0,
                  ),
                  buildItem(
                    title: SortType.PriceDesc.name,
                    id: SortType.PriceDesc.id,
                    currentId: widget.currentID ?? 0,
                  ),
                  buildItem(
                    title: SortType.LevelDesc.name,
                    id: SortType.LevelDesc.id,
                    currentId: widget.currentID ?? 0,
                  ),
                  buildItem(
                    title: SortType.LevelAsc.name,
                    id: SortType.LevelAsc.id,
                    currentId: widget.currentID ?? 0,
                  ),
                  buildItem(
                    title: SortType.Rating.name,
                    id: SortType.Rating.id,
                    currentId: widget.currentID ?? 0,
                  ),
                  buildItem(
                    title: SortType.Orders.name,
                    id: SortType.Orders.id,
                    currentId: widget.currentID ?? 0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildItem(
      {required String title, required int id, required int currentId}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, id);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffdcdcdc),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
              child: FCoreImage(id == currentId
                  ? IconConstants.icRadioFill
                  : IconConstants.icRadioOutline),
            ),
            Text(
              title,
              style: TextAppStyle().normalTextStype(),
            ),
          ],
        ),
      ),
    );
  }
}
