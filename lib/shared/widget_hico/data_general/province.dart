import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../box_decoration/box_decoration.dart';

class ProvinceWidget extends StatefulWidget {
  const ProvinceWidget({
    Key? key,
    required this.provinces,
    this.currentID,
  }) : super(key: key);

  final List<ProvincesModel> provinces;
  final int? currentID;

  @override
  State<ProvinceWidget> createState() => _ProvinceWidgetState();
}

class _ProvinceWidgetState extends State<ProvinceWidget> {
  List<ProvincesModel> _filterProvinces = [];

  @override
  void initState() {
    super.initState();
    onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: CommonConstants.paddingDefault * 2),
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color: AppColor.secondBackgroundColorLight,
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(
              onSubmitted: onSearch,
              style: TextAppStyle().normalTextPink(),
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'supplier.filter.search_provice'.tr,
                  hintStyle: TextAppStyle().normalTextPink(),
                  prefixIcon: Image.asset(IconConstants.icSearch),
                  contentPadding: const EdgeInsets.symmetric(vertical: 7)),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      _filterProvinces.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.pop(context, _filterProvinces[index]);
                        },
                        child: BoxDecorationWidget(
                          height: 45,
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.borderGrayColorLight,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _filterProvinces[index].name ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextAppStyle().normalTextStype(),
                                ),
                                (_filterProvinces[index].id == widget.currentID)
                                    ? FCoreImage(
                                        IconConstants.icSuccess,
                                        width: 16,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void onSearch(String key) {
    setState(() {
      _filterProvinces = widget.provinces
          .where((element) =>
              element.name != null &&
              element.name!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    });
  }
}
