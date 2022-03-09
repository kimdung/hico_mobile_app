import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class CarViewBookOnlineWidget extends StatefulWidget {
  final BookOnline bookOnline;
  const CarViewBookOnlineWidget({Key? key, required this.bookOnline})
      : super(key: key);

  @override
  _CarViewBookOnlineWidgetState createState() =>
      _CarViewBookOnlineWidgetState();
}

class _CarViewBookOnlineWidgetState extends State<CarViewBookOnlineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FCoreImage(
            ImageConstants.bookOnlineBg,
            height: 100,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 16, right: 16),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.bookOnline.name!,
                    style: TextAppStyle().textTitleNameColorStyle(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            RatingBar.builder(
                              onRatingUpdate: (rating) {
                                print('$rating');
                              },
                              itemSize: 20,
                              initialRating: 3,
                              minRating: 0.5,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 1,
                              // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_sharp,
                                color: Colors.amber,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 7),
                              child: Text(
                                widget.bookOnline.rate.toString(),
                                style: TextAppStyle().textInputFormFieldStyle(),
                              ),
                            ),
                            Text(
                              '(${widget.bookOnline.countRate.toString()} đánh giá)',
                              style: TextAppStyle().greyTextFormFieldStyle(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Row(
                          children: [
                            FCoreImage(IconConstants.icAddressHospital),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '${widget.bookOnline.distance.toString()} km',
                                style: TextAppStyle().textInputFormFieldStyle(),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                const Divider(
                  height: 13,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  child: Row(
                    children: [
                      FCoreImage(IconConstants.location),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '${widget.bookOnline.address}',
                            style: TextAppStyle().textInputFormFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, left: 4),
                  child: Row(
                    children: [
                      FCoreImage(IconConstants.icPhone),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${widget.bookOnline.numberPhone}',
                            style: TextAppStyle().textInputFormFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, left: 4),
                  child: Row(
                    children: [
                      FCoreImage(IconConstants.icClock),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${widget.bookOnline.time}',
                            style: TextAppStyle().textInputFormFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookOnline {
  String? name;
  double? rate;
  int? countRate;
  double? distance;
  String? address;
  String? numberPhone;
  String? time;

  BookOnline(
      {this.address,
      this.numberPhone,
      this.countRate,
      this.distance,
      this.name,
      this.rate,
      this.time});
}
