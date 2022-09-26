import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/extend/controller/time_extension_controller.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class ItemExtendWidget extends StatelessWidget {
  const ItemExtendWidget({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimeExtensionController>();
    return GetBuilder<TimeExtensionController>(
      init: controller,
      builder: (con) => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 0.0,
                color: const Color(0xFFFF7DA5).withOpacity(0.3),
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 18.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          width: double.infinity,
          child: Text(
            ' - JPY',
            style: TextAppStyle().normalTextPink(),
          ),
        ),
      ),
    );
  }
}
