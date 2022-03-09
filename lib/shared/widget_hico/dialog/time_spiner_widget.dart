import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/general_button.dart';

class TimeSpinerWidget extends StatefulWidget {
  const TimeSpinerWidget({
    Key? key,
    this.currentTime,
  }) : super(key: key);

  final DateTime? currentTime;

  @override
  State<TimeSpinerWidget> createState() => _TimeSpinerWidgetState();
}

class _TimeSpinerWidgetState extends State<TimeSpinerWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime? _dateTime;
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'supplier.filter.choose_time'.tr,
                  style: TextAppStyle().largeTextPink(),
                ),
                const SizedBox(height: 10),
                TimePickerSpinner(
                  spacing: 20,
                  minutesInterval: 30,
                  time: widget.currentTime,
                  isForce2Digits: true,
                  normalTextStyle:
                      TextAppStyle().largeTextGrey().copyWith(fontSize: 18),
                  highlightedTextStyle: TextAppStyle()
                      .largeTextStype()
                      .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                  onTimeChange: (time) {
                    _dateTime = time;
                  },
                ),
              ],
            ),
          ),
          GeneralButton(
            borderColor: AppColor.primaryColorLight,
            backgroundColor: AppColor.primaryColorLight,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onPressed: () {
              Navigator.pop(context, _dateTime);
            },
            child: Text(
              'OK',
              style: TextAppStyle().normalTextWhite(),
            ),
          ),
        ],
      ),
    );
  }
}
