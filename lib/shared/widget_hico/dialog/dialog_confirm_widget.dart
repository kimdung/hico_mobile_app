import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/general_button.dart';

class DialogConfirmWidget extends StatefulWidget {
  const DialogConfirmWidget({
    Key? key,
    this.title,
    required this.description,
    this.height,
    this.cancelTxt,
    this.acceptTxt,
  }) : super(key: key);

  final double? height;
  final String? title;
  final String description;
  final String? cancelTxt;
  final String? acceptTxt;

  @override
  State<DialogConfirmWidget> createState() => _DialogConfirmWidgetState();
}

class _DialogConfirmWidgetState extends State<DialogConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                if (widget.title != null && widget.title != '')
                  Text(
                    widget.title ?? '',
                    textAlign: TextAlign.center,
                    style: TextAppStyle().normalTextStype().copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                const SizedBox(height: 5),
                if (widget.description != '')
                  Text(
                    widget.description.toString(),
                    textAlign: TextAlign.center,
                    style: TextAppStyle().normalTextStype(),
                  ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.cancelTxt ?? 'order.detail.cancel'.tr,
                    style: TextAppStyle().normalTextWhite(),
                  ),
                ),
              ),
              const SizedBox(width: 1),
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    widget.acceptTxt ?? 'accept'.tr,
                    style: TextAppStyle().normalTextWhite(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
