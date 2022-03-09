import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hico/resource/assets_constant/icon_constants.dart';
import 'package:hico/resource/assets_constant/images_constants.dart';
import 'package:hico/shared/constants/colors.dart';
import 'package:hico/shared/constants/common.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';
import 'package:hico/shared/widget_hico/box_decoration/box_decoration.dart';
import 'package:hico/shared/widget_hico/button/general_button.dart';
import 'package:hico/shared/widgets/image_widget/fcore_image.dart';
import 'package:hico/shared/widget_hico/image_widget/network_image.dart';
import 'package:ui_api/models/invoice/invoice_list_model.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({Key? key, this.onPress, required this.invoice})
      : super(key: key);

  final InvoiceHistoryModel invoice;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    final task = invoice.taskCompleteNumber ?? 0;
    final service = invoice.serviceName ?? '';
    final price = invoice.price ?? 0;
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 14),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.secondColorLight.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 26),
                        width: 80,
                        height: 80,
                        child: (invoice.supplierAvatar != null &&
                                invoice.supplierAvatar != '')
                            ? NetWorkImage(
                                image: invoice.supplierAvatar ?? '',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                radius: 8,
                              )
                            : Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),
                              Text(
                                invoice.supplierName ?? '',
                                style: TextAppStyle().normalTextStype(),
                              ),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                  icon: IconConstants.icSuccessOrder,
                                  title: '$task ${'invoice.misson'.tr}'),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                  icon: IconConstants.icServicePink,
                                  title: '${'invoice.service'.tr} $service'),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                  icon: IconConstants.icMoneyBlue,
                                  title: '$price JPY/${'invoice.hours'.tr}'),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonConstants.paddingDefault),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 11),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColorLight,
                              borderRadius: BorderRadius.circular(80)),
                          child: Row(
                            children: [
                              FCoreImage(
                                IconConstants.icCalendarWhite,
                                width: 12,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                invoice.workingDate ?? '',
                                style: TextAppStyle()
                                    .smallTextStype()
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 11),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColorLight,
                              borderRadius: BorderRadius.circular(80)),
                          child: Row(
                            children: [
                              FCoreImage(
                                IconConstants.icClockWhite,
                                width: 12,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                invoice.workingTime ?? '',
                                style: TextAppStyle()
                                    .smallTextStype()
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (invoice.status == InvoiceStatus.Accepted.index)
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                                onPress: () {
                                  print('chat');
                                },
                                icon: IconConstants.icChatColor,
                                title: 'order.detail.chat'.tr,
                                border: Border(
                                  right: BorderSide(
                                    color: AppColor.primaryColorLight,
                                    width: 0.5,
                                  ),
                                  top: BorderSide(
                                    color: AppColor.primaryColorLight,
                                    width: 1,
                                  ),
                                )),
                          ),
                          Expanded(
                            child: _buildActionButton(
                                onPress: () {},
                                icon: IconConstants.icCallColor,
                                title: 'order.detail.call'.tr,
                                border: Border(
                                  right: BorderSide(
                                    color: AppColor.primaryColorLight,
                                    width: 0.5,
                                  ),
                                  top: BorderSide(
                                    color: AppColor.primaryColorLight,
                                    width: 1,
                                  ),
                                )),
                          ),
                          Expanded(
                            child: _buildActionButton(
                                onPress: () {},
                                icon: IconConstants.icVideoCallColor,
                                title: 'order.detail.video'.tr,
                                border: Border(
                                  top: BorderSide(
                                    color: AppColor.primaryColorLight,
                                    width: 1,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )

                  // Container(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: _buildActionButton(
                  //       onPress: () {},
                  //       icon: IconConstants.icCalendarPink,
                  //       title: 'supplier.book'.tr,
                  //       border: Border(
                  //         top: BorderSide(
                  //           color: AppColor.primaryColorLight,
                  //           width: 1,
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressItem({required String icon, required String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: Image.asset(
            icon,
            width: 15,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextAppStyle().smallTextGrey(),
          ),
        )
      ],
    );
  }

  Widget _buildActionButton(
      {required String icon,
      required String title,
      required Border border,
      required Function()? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: border,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 17,
            ),
            const SizedBox(width: 10),
            Text(title, style: TextAppStyle().smallTextBlack())
          ],
        ),
      ),
    );
  }
}
