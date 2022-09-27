part of 'supplier_booking_checkout_screen.dart';

extension SupplierBookingCheckoutComponents on SupplierBookingCheckoutScreen {
  Widget _buildTitleSection({required String title, String? icon}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: FCoreImage(icon, width: 24),
            ),
          Text(
            title,
            style: TextAppStyle()
                .normalTextStype()
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GeneralButton(
                onPressed: () {},
                height: 47,
                backgroundColor: AppColor.greenColorLight,
                borderColor: AppColor.greenColorLight,
                padding: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      child: FCoreImage(IconConstants.icCallWhite, width: 16),
                    ),
                    Text(
                      'order.detail.call'.tr,
                      style: TextAppStyle().normalTextWhite(),
                    )
                  ],
                )),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GeneralButton(
                onPressed: () {},
                height: 47,
                backgroundColor: AppColor.blueColorLight,
                borderColor: AppColor.blueColorLight,
                padding: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: FCoreImage(IconConstants.icVideoWhite, width: 16),
                    ),
                    Text(
                      'order.detail.video'.tr,
                      style: TextAppStyle().normalTextWhite(),
                    )
                  ],
                )),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GeneralButton(
                onPressed: () {},
                height: 47,
                padding: 10,
                backgroundColor: AppColor.primaryColorLight,
                borderColor: AppColor.primaryColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: FCoreImage(IconConstants.icChatWhite, width: 16),
                    ),
                    Text(
                      'order.detail.chat'.tr,
                      style: TextAppStyle().normalTextWhite(),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildCustomerInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //alignment: Alignment.centerLeft,
      child: Column(
        children: [
          _buildTitleSection(title: 'invoice.detail.supplier'.tr),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 14),
                child: FCoreImage(IconConstants.icUserTag, width: 24),
              ),
              Text(
                controller.bookingPrepare.value.supplier!.name ?? '',
                style: TextAppStyle().genaralTextStyle().copyWith(
                      color: AppColor.blueTextColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOrderInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //alignment: Alignment.centerLeft,
      child: Column(
        children: [
          _buildTitleSection(title: 'order.detail.info_title'.tr),
          _buildOrderInfoItem(
            icon: IconConstants.icOrderMethod,
            title: 'order.detail.order_type'.tr,
            type: OrderInfoViewType.Button,
            value: controller
                .bookingPrepare.value.supplierRequest!.filterIsOnline
                .toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfoItem(
      {required String icon,
      required String title,
      Color? titleColor,
      FontWeight? titleFontWeight,
      OrderInfoViewType type = OrderInfoViewType.Text,
      required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  child: FCoreImage(icon, width: 24),
                ),
                Text(
                  title,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: titleColor ?? Colors.black,
                        fontWeight: titleFontWeight ?? FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          _buildValueContent(type: type, value: value),
        ],
      ),
    );
  }

  Widget _buildValueContent(
      {required OrderInfoViewType type, required String value}) {
    switch (type) {
      case OrderInfoViewType.Text:
        return Text(
          value,
          textAlign: TextAlign.right,
          style: TextAppStyle().normalTextGrey(),
        );
      case OrderInfoViewType.Button:
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color:
                    value == '1' ? AppColor.onlineColor : AppColor.offlineColor,
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              value == '1' ? 'Online' : 'Offline',
              style: TextAppStyle().normalTextWhite(),
            ));
      case OrderInfoViewType.Status:
        return Text(
          value,
          textAlign: TextAlign.right,
          style: TextAppStyle().normalTextGrey(),
        );
      default:
        return Container();
    }
  }

  Widget buildServiceInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault),
      child: Column(
        children: [
          _buildTitleSection(title: 'order.detail.service_title'.tr),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 23),
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.secondColorLight.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: (controller.bookingPrepare.value.service!.displayImage !=
                        null)
                    ? NetWorkImage(
                        image: controller
                            .bookingPrepare.value.service!.displayImage!,
                        width: 58,
                        height: 58,
                      )
                    : Image.asset(
                        ImageConstants.serviceDefault,
                      ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.bookingPrepare.value.service!.name ?? '',
                        style: TextAppStyle().genaralTextStyle().copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                          '${'booking.department'.tr}: ${controller.bookingPrepare.value.supplier!.serviceName ?? ''}',
                          style: TextAppStyle().genaralTextStyle().copyWith(
                                color: Colors.black,
                              )),
                      Container(
                        child: controller.bookingPrepare.value.supplierRequest!
                                    .filterIsOnline ==
                                CommonConstants.online
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${controller.bookingPrepare.value.supplier!.servicePrice} JPY/${'invoice.hours'.tr}',
                                      style: TextAppStyle()
                                          .genaralTextStyle()
                                          .copyWith(
                                            color: AppColor.blueTextColor,
                                            fontWeight: FontWeight.w500,
                                          )),
                                  Text('x1 ${'invoice.hours'.tr}',
                                      style: TextAppStyle()
                                          .genaralTextStyle()
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          )),
                                ],
                              )
                            : Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${controller.bookingPrepare.value.supplier!.serviceOfflineMinPrice} JPY/0,5 - ${controller.bookingPrepare.value.supplier!.serviceOfflineMinHours} ${'invoice.hours'.tr}',
                                        style: TextAppStyle()
                                            .genaralTextStyle()
                                            .copyWith(
                                              color: AppColor.blueTextColor,
                                              fontWeight: FontWeight.w500,
                                            )),
                                    Text('x 1',
                                        style: TextAppStyle()
                                            .genaralTextStyle()
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${'invoice.incurred'.tr}: ${controller.bookingPrepare.value.supplier!.servicePrice} JPY/ 1${'invoice.hours'.tr}',
                                        style: TextAppStyle()
                                            .genaralTextStyle()
                                            .copyWith(
                                              color: AppColor.blueTextColor,
                                              fontWeight: FontWeight.w500,
                                            )),
                                    Text('x 1',
                                        style: TextAppStyle()
                                            .genaralTextStyle()
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                  ],
                                )
                              ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildWorkingTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitleSection(title: 'order.detail.work_time'.tr),
            Text(
                controller.bookingPrepare.value.supplierRequest?.filterDate ??
                    '',
                style: TextAppStyle().normalTextStype())
          ],
        ),
        _buildOrderInfoItem(
            icon: IconConstants.icOrderTime,
            title:
                '${(controller.bookingPrepare.value.supplierRequest!.filterIsOnline == CommonConstants.online ? controller.bookingPrepare.value.totalTime : controller.bookingPrepare.value.supplier!.serviceOfflineMinHours)} ${'invoice.hours'.tr}',
            titleColor: AppColor.blueTextColor,
            titleFontWeight: FontWeight.w500,
            type: OrderInfoViewType.Text,
            value: controller
                    .bookingPrepare.value.supplierRequest?.filterTimeSlot ??
                ''),
        if (controller.bookingPrepare.value.supplierRequest!.filterIsOnline ==
            CommonConstants.offline)
          _buildOrderInfoItem(
              icon: IconConstants.icOrderCode,
              title:
                  '${'invoice.incurred'.tr} ${controller.hours.toString()} ${'invoice.hours'.tr}',
              titleColor: AppColor.blueTextColor,
              titleFontWeight: FontWeight.w500,
              type: OrderInfoViewType.Text,
              value: ''),
        Text('time.note'.tr, style: TextAppStyle().normalTextGrey())
      ]),
    );
  }

  Widget buildVoucher() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: _buildTitleSection(
                  title: 'booking.voucher'.tr,
                  icon: IconConstants.ticket,
                )),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  controller.loadVoucher();
                },
                child: (controller.discount.value != 0)
                    ? Text(
                        '${controller.discount.value} JPY',
                        textAlign: TextAlign.right,
                        style: TextAppStyle().normalTextStype().copyWith(
                              color: AppColor.blueTextColor,
                            ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'booking.voucher_select'.tr,
                            textAlign: TextAlign.right,
                            style: TextAppStyle().normalTextStype().copyWith(
                                  color: AppColor.blueTextColor,
                                ),
                          ),
                          const SizedBox(width: 9),
                          FCoreImage(IconConstants.icArrowRight),
                        ],
                      ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Widget buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: _buildTitleSection(
                    title: 'booking.wallet'.tr,
                    icon: IconConstants.icMoneyPink,
                  )),
              Expanded(
                flex: 1,
                child: Text(
                  '${controller.info.value.accountBalance} JPY',
                  textAlign: TextAlign.right,
                  style: TextAppStyle().normalTextStype().copyWith(
                        color: AppColor.blueTextColor,
                      ),
                ),
              )
            ],
          ),
          Container(
            child: (controller.paymentMethodId.value != 0)
                ? Text(
                    PaymentMethod.values[controller.paymentMethodId.value].name,
                    textAlign: TextAlign.left,
                    style: TextAppStyle().smallTextGrey(),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildOrderDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildDetailItem(
              title: 'order.detail.total_pay'.tr,
              value: '${controller.total.value} JPY',
              type: OrderInfoViewType.Text),
          if (controller
                  .bookingPrepare.value.supplierRequest?.filterIsOnline! ==
              CommonConstants.offline)
            _buildDetailItem(
                title: 'order.detail.ship_fee'.tr,
                value: '0 JPY',
                type: OrderInfoViewType.Text),
          if (controller.discount.value != 0)
            _buildDetailItem(
                title: 'order.detail.voucher'.tr,
                value: '${controller.discount.value} JPY',
                type: OrderInfoViewType.Text),
          _buildDetailItem(
              title: 'order.detail.pay_value'.tr,
              sizeTitle: 14,
              colorTitle: Colors.black,
              value: '${controller.totalPay.value} JPY',
              fweightValue: FontWeight.bold,
              colorValue: AppColor.blueTextColor,
              type: OrderInfoViewType.Text),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
      {required String title,
      double? sizeTitle,
      Color? colorTitle,
      required String value,
      double? sizeValue,
      Color? colorValue,
      FontWeight? fweightValue,
      required OrderInfoViewType type}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextAppStyle().secondTextStyle().copyWith(
                    color: colorTitle ?? AppColor.sixTextColorLight,
                    fontWeight: FontWeight.w500,
                    fontSize: sizeTitle ?? 12,
                  )),
          type == OrderInfoViewType.Text
              ? Text(value,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: colorValue ?? AppColor.sixTextColorLight,
                        fontWeight: fweightValue ?? FontWeight.w500,
                        fontSize: sizeValue ?? 14,
                      ))
              : InkWell(
                  onTap: () {}, child: SvgPicture.asset(IconConstants.icRight))
        ],
      ),
    );
  }

  Widget _buildInputAddressCode() {
    return TextFormField(
      controller: controller.zipCode,
      onChanged: (value) {
        controller.loadAddress(value);
      },
      keyboardType: TextInputType.text,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: 'profile.update.address_code'.tr,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextBlack(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputTemplate({
    required TextEditingController textEditng,
    required String title,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      controller: textEditng,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        labelText: title,
        labelStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextBlack(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildInputTextArea({
    required TextEditingController textEditng,
    required String title,
  }) {
    return TextFormField(
      controller: textEditng,
      keyboardType: TextInputType.text,
      maxLines: 3,
      decoration: TextFieldDecoration.borderOutline(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.sixTextColorLight,
        hintText: title,
        hintStype: TextAppStyle().smallTextGrey(),
        radius: 6,
      ),
      style: TextAppStyle().smallTextBlack(),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget buildSuggestAddress() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'booking.suggest'.tr,
                  style: TextAppStyle()
                      .smallTextBlack()
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: InkWell(
                    onTap: () {
                      controller.closeSuggest();
                    },
                    child: FCoreImage(IconConstants.iconCLose)),
              ),
            ],
          ),
          ...List.generate(
            controller.addressList.length,
            (int index) => InkWell(
              onTap: () {
                controller.selectAddress(controller.addressList[index]);
              },
              child: Container(
                width: Get.width * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  controller.addressList[index].fullAddress!,
                  style: TextAppStyle().smallTextBlack(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
