import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class CardViewHistory extends StatefulWidget {
  final CardViewHistoryModel? cardViewHistoryModel;
  CardViewHistory({Key? key, required this.cardViewHistoryModel})
      : super(key: key);

  @override
  _CardViewHistoryState createState() => _CardViewHistoryState();
}

class _CardViewHistoryState extends State<CardViewHistory> {
  bool rating = true;
  @override
  Widget build(BuildContext context) {
    return widget.cardViewHistoryModel != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.secondTextColorLight,
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.cardViewHistoryModel!.orderCode ?? '',
                        style: TextAppStyle().textOrderCodeStyle()),
                    Text(
                        widget.cardViewHistoryModel!.type!
                            ? 'Hoàn thành'
                            : 'Đã khám',
                        style: TextAppStyle().textTimeMyproductTitleStyle()),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(height: 1, color: AppColor.dividerColorLightListBank),
                const SizedBox(height: 16),
                widget.cardViewHistoryModel!.type!
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FCoreImage(IconConstants.icHistory),
                          const SizedBox(width: 8),
                          Text('Bác sĩ: ${widget.cardViewHistoryModel!.name}',
                              style: TextAppStyle().textPhoneNumberStyle()),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FCoreImage(IconConstants.icAddressHospital),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      widget.cardViewHistoryModel!.hospital ??
                                          '',
                                      style: TextAppStyle()
                                          .textPhoneNumberStyle()),
                                  Text(
                                      widget.cardViewHistoryModel!.address ??
                                          '',
                                      style: TextAppStyle().textAddressStyle()),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FCoreImage(IconConstants.icTimeHospital),
                              const SizedBox(width: 8),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Thời gian khám: ',
                                        style: TextAppStyle()
                                            .textPhoneNumberStyle()),
                                    TextSpan(
                                        text:
                                            widget.cardViewHistoryModel!.time ??
                                                '',
                                        style: TextAppStyle()
                                            .textTitleContactStyle()),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                const SizedBox(height: 16),
                Container(height: 1, color: AppColor.dividerColorLightListBank),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = false;
                        });
                      },
                      child: rating
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Thêm đánh giá',
                                    style:
                                        TextAppStyle().textPhoneNumberStyle()),
                                const SizedBox(width: 8),
                                FCoreImage(IconConstants.icAddReview)
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Đánh giá',
                                    style:
                                        TextAppStyle().textPhoneNumberStyle()),
                                const SizedBox(width: 8),
                                RatingBar.builder(
                                  onRatingUpdate: (rating) {
                                    print('$rating');
                                  },
                                  itemSize: 23,
                                  initialRating: 3,
                                  minRating: 0.5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_sharp,
                                    color: Colors.amber,
                                  ),
                                )
                              ],
                            ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      child:
                          FCoreImage(widget.cardViewHistoryModel!.avatar ?? ''),
                    )
                  ],
                )
              ],
            ),
          )
        : Container();
  }
}

class CardViewHistoryModel {
  final bool? type;
  final String? orderCode;
  final String? name;
  final String? hospital;
  final String? address;
  final String? time;
  final String? avatar;
  CardViewHistoryModel({
    this.avatar,
    this.type = true,
    this.orderCode,
    this.name,
    this.hospital,
    this.address,
    this.time,
  });
}
