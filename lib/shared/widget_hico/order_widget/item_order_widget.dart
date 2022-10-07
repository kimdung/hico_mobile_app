import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/invoice/invoice_list_model.dart';
import 'package:ui_api/models/invoice/invoice_status.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/badge/badge_widget.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../image_widget/network_image.dart';

class ItemOrderWidget extends StatefulWidget {
  final InvoiceHistoryModel invoice;
  final Function()? onPress;

  final Function() onChat;
  final Function() onCall;
  final Function() onVideo;

  const ItemOrderWidget({
    Key? key,
    this.onPress,
    required this.invoice,
    required this.onChat,
    required this.onCall,
    required this.onVideo,
  }) : super(key: key);

  @override
  State<ItemOrderWidget> createState() => _ItemOrderWidgetState();
}

class _ItemOrderWidgetState extends State<ItemOrderWidget> {
  Channel? _channel;
  int _badge = 0;

  @override
  void initState() {
    super.initState();

    // if (widget.invoice.status == InvoiceStatus.accepted.id &&
    //     AppDataGlobal.client != null &&
    //     _channel == null) {
    //   _channel = AppDataGlobal.client!
    //       .channel('messaging', id: widget.invoice.getChatChannel());
    //   _listenerBadge();
    // }
  }

  Future<void> _listenerBadge() async {
    try {
      await _channel?.watch();
      _channel?.state?.unreadCountStream.listen((event) {
        if (mounted) {
          setState(() => _badge = event);
        }
      });
    } catch (e) {
      debugPrint('[ItemOrderWidget] get unread error ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.invoice.taskCompleteNumber ?? 0;
    final service = widget.invoice.serviceName ?? '';
    final price = widget.invoice.price ?? 0;

    if (widget.invoice.status == InvoiceStatus.accepted.id &&
        AppDataGlobal.client != null &&
        _channel == null) {
      _channel = AppDataGlobal.client!
          .channel('messaging', id: widget.invoice.getChatChannel());
      _listenerBadge();
    }

    return InkWell(
      onTap: widget.onPress,
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
                        child: (widget.invoice.supplierAvatar != null &&
                                widget.invoice.supplierAvatar != '')
                            ? NetWorkImage(
                                image: widget.invoice.supplierAvatar ?? '',
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
                                widget.invoice.supplierName ?? '',
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
                              Container(
                                child: widget.invoice.workingForm ==
                                        CommonConstants.online
                                    ? _buildAddressItem(
                                        icon: IconConstants.icMoneyBlue,
                                        title:
                                            '$price JPY/${'invoice.hours'.tr}')
                                    : _buildPriceItem(
                                        icon: IconConstants.icMoneyBlue,
                                        title:
                                            '${widget.invoice.offlinePriceMin} JPY/ 0,5 - ${widget.invoice.minHours} ${'invoice.hours'.tr}',
                                        subTitle:
                                            '${'invoice.incurred'.tr}: ${widget.invoice.price} JPY/ 1${'invoice.hours'.tr}'),
                              ),
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
                                widget.invoice.workingDate ?? '',
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
                                widget.invoice.workingTime ?? '',
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
                  if (widget.invoice.status == InvoiceStatus.accepted.id)
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                              onPress: widget.onChat,
                              icon: IconConstants.icChatColor,
                              title: 'order.detail.chat'.tr,
                              badge: _badge,
                              border: Border(
                                right: BorderSide(
                                  color: AppColor.primaryColorLight,
                                  width: 0.5,
                                ),
                                top: BorderSide(
                                  color: AppColor.primaryColorLight,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: _buildActionButton(
                              onPress: widget.invoice.isNotCall()
                                  ? null
                                  : widget.onCall,
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
                              ),
                            ),
                          ),
                          Expanded(
                            child: _buildActionButton(
                              onPress: widget.invoice.isNotCall()
                                  ? null
                                  : widget.onVideo,
                              icon: IconConstants.icVideoCallColor,
                              title: 'order.detail.video'.tr,
                              border: Border(
                                top: BorderSide(
                                  color: AppColor.primaryColorLight,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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

  Widget _buildPriceItem(
      {required String icon, required String title, required String subTitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12, top: 3),
          child: Image.asset(
            icon,
            width: 15,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextAppStyle().smallTextGrey(),
              ),
              Text(
                subTitle,
                style: TextAppStyle().smallTextGrey(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildActionButton(
      {required String icon,
      required String title,
      required Border border,
      required Function()? onPress,
      int badge = 0}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: border,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 22,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    icon,
                    width: 17,
                  ),
                  const SizedBox(width: 5),
                  BadgeWidget(badge: badge),
                ],
              ),
            ),
            Text(title, style: TextAppStyle().smallTextBlack())
          ],
        ),
      ),
    );
  }
}
