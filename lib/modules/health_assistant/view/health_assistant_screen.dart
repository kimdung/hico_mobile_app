import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/ui_api.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/appbar_slider/appbar_slider_widget.dart';
import '../controller/health_assistant_controller.dart';

part 'health_assistant.childern.dart';

class HealthAssistantScreen extends GetView<HealthAssistantController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            AppBarSlider(promotions: controller.promotions()),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 24,
                        ),
                        _menuHome(lstMenuHome: controller.getLstMenuHome()),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Dịch vụ hỗ trợ đặc biệt cho F0',
                              style: TextAppStyle().textWalletStyle()),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List<Widget>.generate(
                                  controller.getLstService().length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: _serviceCovid(
                                          serviceCovid:
                                              controller.getLstService()[index],
                                        ),
                                      )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        buildPromotions(controller.promotions()),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Dịch vụ tiện ích',
                              style: TextAppStyle().textWalletStyle()),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            runSpacing: 16,
                            spacing: 16,
                            children: List<Widget>.generate(
                              controller.getLstCovenientService().length + 1,
                              (index) {
                                return index <
                                        controller
                                            .getLstCovenientService()
                                            .length
                                    ? _covenientService(
                                        covenientServic: controller
                                            .getLstCovenientService()[index],
                                      )
                                    : _seeMore();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Dịch vụ tiện ích',
                              style: TextAppStyle().textWalletStyle()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List<Widget>.generate(
                                4,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: FCoreImage(
                                    ImageConstants.bhBaoViet,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        _footerHome(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
