import 'package:flutter/material.dart';
import 'package:hico/shared/constants/colors.dart';
import 'package:hico/shared/styles/text_style/text_style.dart';

class CancelInvoiceWidget extends StatelessWidget {
  const CancelInvoiceWidget({
    Key? key,
    this.total,
    this.isFined,
  }) : super(key: key);

  final int? isFined;
  final double? total;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (isFined == 0)
          ? Column(
              children: [
                Text(
                  'Hệ thống sẽ hoàn lại toàn bộ số tiền bạn đã thanh toán.',
                  textAlign: TextAlign.center,
                  style: TextAppStyle().normalTextStype(),
                ),
                const SizedBox(height: 4),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Lưu ý: ',
                    style: TextAppStyle()
                        .smallTextBlack()
                        .copyWith(color: AppColor.redTextColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Bạn sẽ bị ghi nhận lần hủy đơn này!',
                        style: TextAppStyle().smallTextBlack(),
                      ),
                    ],
                  ),
                )
              ],
            )
          : RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Oh! Bạn sẽ bị mất toàn bộ ',
                style: TextAppStyle().normalTextStype(),
                children: <TextSpan>[
                  TextSpan(
                      text: '$total JPY',
                      style: TextStyle(color: AppColor.redTextColor)),
                  const TextSpan(text: ' nếu hủy đơn hàng này!'),
                ],
              ),
            ),
    );
  }
}
