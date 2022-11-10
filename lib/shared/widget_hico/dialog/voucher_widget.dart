import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/voucher/voucher_model.dart';
import 'package:ui_api/request/invoice/rating_request.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/general_button.dart';

class VoucherDialogWidget extends StatefulWidget {
  VoucherDialogWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VoucherModel item;
  final ratingForm = GlobalKey<FormState>();

  @override
  State<VoucherDialogWidget> createState() => _VoucherDialogWidgetState();
}

class _VoucherDialogWidgetState extends State<VoucherDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              widget.item.name.toString(),
              style: TextAppStyle().normalTextPink(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _section(
                    title: 'voucher.code'.tr,
                    content: widget.item.code.toString(),
                  ),
                  const SizedBox(height: 8),
                  _section(
                    title: 'voucher.promotion'.tr,
                    content: widget.item.condition.toString(),
                  ),
                  const SizedBox(height: 8),
                  _section(
                      title: 'voucher.expired'.tr,
                      content:
                          'HSD: ${widget.item.startTime} - ${widget.item.endTime}'),
                  const SizedBox(height: 8),
                  _sectionHtml(
                      title: 'voucher.condition'.tr,
                      content: widget.item.description.toString()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GeneralButton(
            onPressed: () {
              Navigator.pop(context);
            },
            borderColor: AppColor.primaryColorLight,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(24),
            child: Text(
              'voucher.skip'.tr,
              style: TextAppStyle()
                  .titleButtonStyle()
                  .copyWith(color: AppColor.primaryColorLight),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _section({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextAppStyle().normalTextStype(),
        ),
        Row(
          children: [
            Text(
              content,
              style: TextAppStyle().normalTextGrey(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionHtml({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextAppStyle().normalTextStype(),
        ),
        Html(
          data: content,
          style: {
            'body': Style(
                fontSize: FontSize(14.0),
                fontWeight: FontWeight.w400,
                color: AppColor.sixTextColorLight),
          },
        ),
      ],
    );
  }
}
