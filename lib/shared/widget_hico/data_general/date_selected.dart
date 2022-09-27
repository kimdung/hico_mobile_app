import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ui_api/models/user/user_time_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../box_decoration/box_decoration.dart';

class DateSelectedWidget extends StatefulWidget {
  const DateSelectedWidget({
    Key? key,
    required this.date,
    this.currentID = '',
  }) : super(key: key);

  final List<UserTimeModel> date;
  final String currentID;

  @override
  State<DateSelectedWidget> createState() => _DateSelectedWidgetState();
}

class _DateSelectedWidgetState extends State<DateSelectedWidget> {
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
            'service.time_slot'.tr,
            style: TextAppStyle().normalTextPink(),
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
                      widget.date.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.pop(context, widget.date[index].date);
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
                                  widget.date[index].date ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextAppStyle().normalTextStype(),
                                ),
                                (widget.date[index].date == widget.currentID)
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
}
