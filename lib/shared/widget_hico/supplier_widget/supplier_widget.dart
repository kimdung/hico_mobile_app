import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/network_image.dart';

class SupplierWidget extends StatelessWidget {
  const SupplierWidget({
    Key? key,
    this.onPress,
    required this.invoice,
    this.onPressButton,
  }) : super(key: key);

  final SupplierInfoModel invoice;
  final Function()? onPress;
  final Function()? onPressButton;

  @override
  Widget build(BuildContext context) {
    final task = invoice.taskCompleteNumber ?? 0;
    final service = invoice.serviceName ?? '';
    final price = invoice.servicePrice ?? 0;
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
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 18, right: 28),
                        child: NetWorkImage(
                          image: invoice.avatarImage ?? '',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          radius: 8,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),
                              Text(
                                invoice.name ?? '',
                                style: TextAppStyle().normalTextStype(),
                              ),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                icon: IconConstants.icSuccess,
                                title: '$task ${'invoice.misson'.tr}',
                              ),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                icon: IconConstants.icServicePink,
                                title: '${'invoice.service'.tr} $service',
                              ),
                              const SizedBox(height: 5),
                              Container(
                                child: invoice.isOnline == 1 ? 
                                  _buildAddressItem(
                                  icon: IconConstants.icMoneyBlue,
                                  title: '$price JPY/${'invoice.hours'.tr}'): 
                                  _buildPriceItem(
                                  icon: IconConstants.icMoneyBlue,
                                  title: '${invoice.serviceOfflineMinPrice} JPY/ 0,5 - ${invoice.serviceOfflineMinHours} ${'invoice.hours'.tr}',
                                  subTitle: '${'invoice.incurred'.tr}: ${invoice.servicePrice} JPY/ 1${'invoice.hours'.tr}'),
                              ),
                              const SizedBox(height: 8),
                              _buildAddressItem(
                                icon: IconConstants.icMoneyPink,
                                title: '${'supplier.filter.move_fee'.tr}',
                              ),
                              const SizedBox(height: 5),
                              _buildAddressItem(
                                icon: IconConstants.icTrain,
                                title: '${'profile.station'.tr} ${invoice.nearestStation}',
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: _buildActionButton(
                        onPress: onPressButton,
                        icon: IconConstants.icCalendarPink,
                        title: 'supplier.book'.tr,
                        border: Border(
                          top: BorderSide(
                            color: AppColor.primaryColorLight,
                            width: 1,
                          ),
                        )),
                  ),
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

  Widget _buildPriceItem({required String icon, required String title, required String subTitle}) {
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
      required Function()? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 17,
            ),
            const SizedBox(width: 10),
            Text(title, style: TextAppStyle().smallTextPink())
          ],
        ),
      ),
    );
  }
}
