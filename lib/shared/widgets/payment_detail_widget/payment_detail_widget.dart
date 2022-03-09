import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../methods/common_method.dart';
import '../../styles/text_style/text_style.dart';

class PaymentDetailWidget extends StatelessWidget {
  final List<PaymentDetailWidgetModel> lstPaymentDetailItem;
  final PaymentDetailWidgetModel bottomItem;
  PaymentDetailWidget(
      {Key? key, required this.lstPaymentDetailItem, required this.bottomItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(lstPaymentDetailItem[index].name,
                        style: TextAppStyle()
                            .textItemDetailNamePagePaymentStyle()),
                    Text(lstPaymentDetailItem[index].value,
                        style: TextAppStyle()
                            .textItemDetailValuePagePaymentStyle()),
                  ],
                ),
              );
            },
            itemCount: lstPaymentDetailItem.length,
            separatorBuilder: (context, index) =>
                Container(height: 1, color: AppColor.dividerColorLight),
          ),
          Container(height: 1, color: AppColor.dividerColorLight),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bottomItem.bottomName,
                    style: TextAppStyle().textItemDetailNamePagePaymentStyle()),
                Text(formatVnd('${bottomItem.bottomValue}'),
                    style:
                        TextAppStyle().textBottomItemValuePagePaymentStyle()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDetailWidgetModel {
  final String name;
  final String value;
  late final String bottomName;
  final String bottomValue;
  PaymentDetailWidgetModel(
      this.name, this.value, this.bottomName, this.bottomValue);
}
