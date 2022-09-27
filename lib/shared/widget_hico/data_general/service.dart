import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ui_api/models/home/services_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../box_decoration/box_decoration.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({
    Key? key,
    required this.services,
    this.currentID,
  }) : super(key: key);

  final List<ServiceModel> services;
  final int? currentID;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
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
            'service'.tr,
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
                      widget.services.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.pop(context, widget.services[index]);
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
                                  widget.services[index].name ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextAppStyle().normalTextStype(),
                                ),
                                (widget.services[index].id == widget.currentID)
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
