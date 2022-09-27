import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/invoice/extend_period_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/item/item_extend_widget.dart';
import '../controller/time_extension_controller.dart';

part 'time_extension_children.dart';

class TimeExtensionScreen extends GetView<TimeExtensionController> {
  const TimeExtensionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconConstants.icBack,
            width: 11,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'extend.title'.tr,
          style: TextAppStyle().titleAppBarStyle(),
        ),
      ),
      body: Obx(() => Column(
            children: [
              _buildHeader(),
              const SizedBox(
                height: 28.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.extendPeriodList.length,
                        (index) =>
                            buildExtendItem(controller.extendPeriodList[index]),
                      )
                    ],
                  ),
                ),
              ),
              //_buildExtendList(),
              _buildExtendButton()
            ],
          )),
      //bottomSheet: _buildExtendButton(),
    );
  }
}
