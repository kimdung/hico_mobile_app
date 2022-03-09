import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';
import 'package:ui_api/models/master_data/districts_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../box_decoration/box_decoration.dart';

class DistrictWidget extends StatefulWidget {
  const DistrictWidget({
    Key? key,
    required this.district,
    this.currentId,
  }) : super(key: key);

  final List<DistrictsModel> district;
  final int? currentId;

  @override
  State<DistrictWidget> createState() => _DistrictWidgetState();
}

class _DistrictWidgetState extends State<DistrictWidget> {
  List<DistrictsModel> _filterDistricts = [];

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
                  hintText: 'supplier.filter.search_district'.tr,
                  hintStyle: TextAppStyle().normalTextPink(),
                  prefixIcon: Image.asset(IconConstants.icSearch),
                  contentPadding: const EdgeInsets.symmetric(vertical: 7)),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.paddingDefault),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    _filterDistricts.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.pop(context, _filterDistricts[index]);
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
                                _filterDistricts[index].name ?? '',
                                textAlign: TextAlign.left,
                                style: TextAppStyle().normalTextStype(),
                              ),
                              (_filterDistricts[index].id == widget.currentId)
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
          )
        ],
      ),
    );
  }

  void onSearch(String key) {
    setState(() {
      _filterDistricts = widget.district
          .where((element) =>
              element.name != null &&
              element.name!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    });
  }
}
