part of 'supplier_booking_screen.dart';

extension BookingSupplierBookingComponents on BookingSupplierBookingScreen {
  Widget buildNoteSection() {
    return Container(
      color: AppColor.secondBackgroundColorLight,
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault,
          vertical: CommonConstants.paddingDefault / 2),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: FCoreImage(
                IconConstants.icOrderCode,
                width: 24,
              )),
          Expanded(
            child: Text(
              'supplier.filter.title_des'.tr,
              style: TextAppStyle().secondTextStyle().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateComponent({
    Function()? onPress,
    TextEditingController? date,
    String? hintText,
    bool prefixIcon = true,
  }) {
    return BoxDecorationWidget(
      height: 47,
      radius: 8,
      shadow: true,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onPress,
            child: AbsorbPointer(
              child: TextFormField(
                controller: date,
                keyboardType: TextInputType.datetime,
                style: TextAppStyle().genaralTextStyle().copyWith(
                      color: AppColor.primaryTextColorLight,
                    ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextAppStyle().genaralTextStyle().copyWith(
                        color: AppColor.primaryTextColorLight,
                      ),
                  contentPadding: const EdgeInsets.fromLTRB(14, 12, 0, 12),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          if (prefixIcon)
            Positioned(
                top: 11,
                right: 14,
                width: 24,
                child: FCoreImage(
                  IconConstants.icArrowDown,
                  width: 24,
                ))
        ],
      ),
    );
  }

  Widget buildTitleComponent({
    required String title,
    bool prefixIcon = true,
    Alignment? alignment,
    Function()? onPress,
  }) {
    return InkWell(
      onTap: onPress,
      child: BoxDecorationWidget(
        height: 47,
        radius: 8,
        shadow: true,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 14),
                alignment: alignment,
                child: Text(
                  title,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: AppColor.primaryTextColorLight,
                      ),
                ),
              ),
            ),
            if (prefixIcon)
              FCoreImage(
                IconConstants.icArrowDown,
                width: 24,
              ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget buildBoxTimeSection({
    MainAxisAlignment? alignment,
    required String title,
    Function()? onPress,
    String? value,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: CommonConstants.paddingDefault),
            child: Text(
              title,
              style: TextAppStyle().genaralBlackTextStyle(),
            ),
          ),
          Expanded(
            child: buildSelectComponent(
              onPress: onPress,
              title: value ?? '00:00',
              textColor: TextAppStyle().normalTextStype(),
              height: 31,
              prefixIcon: true,
              prefixImage: IconConstants.icExpandMore,
              paddingRight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectComponent({
    required String title,
    bool prefixIcon = false,
    String? prefixImage,
    double? paddingRight,
    bool shadow = false,
    bool border = true,
    TextStyle? textColor,
    double? padding,
    double? height,
    Function()? onPress,
  }) {
    return BoxDecorationWidget(
      height: height ?? 42,
      shadow: shadow,
      border: border ? Border.all(color: AppColor.borderPinkBoldColor) : null,
      radius: 6,
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(left: padding ?? 6),
                child: Text(
                  title,
                  style: textColor ?? TextAppStyle().smallTextGrey(),
                ),
              ),
            ),
            if (prefixIcon)
              FCoreImage(
                prefixImage ?? IconConstants.icArrowDown,
                width: 24,
              ),
            SizedBox(width: paddingRight ?? 16),
          ],
        ),
      ),
    );
  }

  Widget buildStarComponent({
    Widget? title,
    Function()? onPress,
  }) {
    return BoxDecorationWidget(
      height: 47,
      shadow: true,
      radius: 6,
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.only(top: 2, left: 14),
                child: title ?? const Text(''),
              ),
            ),
            FCoreImage(
              IconConstants.icArrowDown,
              width: 24,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget buildRadioComponent({required int type}) {
    return InkWell(
      onTap: () => controller.selectRadio(type),
      child: Row(
        children: [
          FCoreImage(
            type.isEqual(controller.isOnline.value)
                ? IconConstants.icRadioFill
                : IconConstants.icRadioOutline,
            fit: BoxFit.fill,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 12),
          Text(type == CommonConstants.online ? 'Online' : 'Offline'),
        ],
      ),
    );
  }

  Widget buildTimeItem({required UserTimeModel timeItem}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                child: Row(
              children: [
                FCoreImage(
                  IconConstants.icCalendarPink,
                  width: 18,
                ),
                const SizedBox(width: 6),
                Text(
                  timeItem.date ?? '',
                  style: TextAppStyle().normalTextStype(),
                ),
              ],
            )),
          ),
          const SizedBox(width: 17),
          Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: FCoreImage(
                      IconConstants.icTimeCircle,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: '',
                        style: TextAppStyle().normalTextStype(),
                        children: <TextSpan>[
                          ...List.generate(
                            timeItem.list!.length,
                            (int index) => TextSpan(
                              text:
                                  '${timeItem.list![index].beginTime}-${timeItem.list![index].endTime}${(index + 1) == timeItem.list!.length ? '' : ', '}',
                              style: TextAppStyle().normalTextStype(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 40,
      width: 40,
    );
  }
}
