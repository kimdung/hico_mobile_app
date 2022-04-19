import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/extend/controller/time_extension_controller.dart';
import '../../constants/colors.dart';

class ItemExtendWidget extends StatelessWidget {
  const ItemExtendWidget({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimeExtensionController>();
    return GetBuilder<TimeExtensionController>(
      init: controller,
      builder: (con) => InkWell(
        onTap: () {
          con.onChooseItemExtend(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: con.extendList[index].isChoose
                ? const Color.fromARGB(1, 252, 238, 241)
                : Colors.white,
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
            '${con.extendList[index].timeExtend} phút - ${con.extendList[index].money} - JPY',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'SVN-Jeko',
              fontWeight: FontWeight.w400,
              color: AppColor.primaryTextColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
