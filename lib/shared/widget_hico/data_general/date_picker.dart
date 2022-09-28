import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hico/shared/constants/colors.dart';
import 'package:hico/shared/constants/common.dart';

import '../../styles/text_style/text_style.dart';
import '../button/general_button.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    this.title,
    this.currentDate,
  }) : super(key: key);

  final String? title;
  final DateTime? currentDate;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _dateTime;
  @override
  void initState() {
    super.initState();
    onchange(widget.currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            widget.title ?? 'supplier.filter.choose_date'.tr,
            style: TextAppStyle().normalTextPink(),
          ),
          Expanded(
            child: Container(
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  onchange(date);
                },
                headerTextStyle: TextAppStyle().largeTextStype(),
                weekdayTextStyle: const TextStyle(color: Colors.black),
                weekendTextStyle: const TextStyle(color: Colors.black),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
                height: 400,
                dayPadding: 1,
                todayBorderColor: Colors.grey,
                todayButtonColor: Colors.white,
                todayTextStyle: TextAppStyle().normalTextStype(),
                selectedDateTime: _dateTime,
                selectedDayButtonColor: AppColor.primaryColorLight,
                selectedDayBorderColor: AppColor.primaryColorLight,
                daysHaveCircularBorder: false,
              ),
            ),
          ),
          const SizedBox(height: 20),
          GeneralButton(
            borderColor: AppColor.primaryColorLight,
            backgroundColor: AppColor.primaryColorLight,
            borderRadius: BorderRadius.circular(24),
            onPressed: () {
              Navigator.pop(context, _dateTime);
            },
            child: Text(
              'confirm'.tr,
              style: TextAppStyle().normalTextWhite(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void onchange(DateTime? value) {
    setState(() {
      _dateTime = value;
    });
  }
}
