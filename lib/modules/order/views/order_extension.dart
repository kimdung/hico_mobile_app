part of 'order_screen.dart';

extension OrderExtension on OrderScreen {
  Widget _buildTitleSection({required String title}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextAppStyle().genaralTextStyle().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
                padding: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FCoreImage(IconConstants.icCallWhite, width: 16),
                    const SizedBox(width: 6),
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
                padding: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FCoreImage(IconConstants.icVideoWhite, width: 16),
                    const SizedBox(width: 6),
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
                padding: 0,
                backgroundColor: AppColor.primaryColorLight,
                borderColor: AppColor.primaryColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FCoreImage(IconConstants.icChatWhite, width: 16),
                    const SizedBox(width: 6),
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
                child: FCoreImage(
                  IconConstants.icUserTag,
                  width: 24,
                ),
              ),
              Text(
                controller.invoice.value.supplierName ?? '',
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
            value: controller.invoice.value.workingForm.toString(),
          ),
          _buildOrderInfoItem(
            icon: IconConstants.icOrderStatus,
            title: 'order.detail.order_status'.tr,
            type: OrderInfoViewType.Status,
            value: controller.invoice.value.status != null
                ? InvoiceStatus.values[controller.invoice.value.status!].name
                : '',
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
                  child: FCoreImage(
                    icon,
                    width: 24,
                  ),
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
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: (controller.invoice.value.service!.displayImage != null)
                    ? NetWorkImage(
                        image: controller.invoice.value.service!.displayImage!,
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
                        controller.invoice.value.service!.name ?? '',
                        style: TextAppStyle().genaralTextStyle().copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                          '${'booking.department'.tr}: ${controller.invoice.value.service!.categoryName ?? ''}',
                          style: TextAppStyle().genaralTextStyle().copyWith(
                                color: Colors.black,
                              )),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${controller.invoice.value.service!.price} JPY/${'invoice.hours'.tr}',
                                style:
                                    TextAppStyle().genaralTextStyle().copyWith(
                                          color: AppColor.blueTextColor,
                                          fontWeight: FontWeight.w500,
                                        )),
                            Text(
                                'x ${controller.invoice.value.hours} ${'invoice.hours'.tr}',
                                style:
                                    TextAppStyle().genaralTextStyle().copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        )),
                          ],
                        ),
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
            Text(controller.invoice.value.workingDate ?? '',
                style: TextAppStyle().normalTextStype())
          ],
        ),
        _buildOrderInfoItem(
            icon: IconConstants.icOrderCode,
            title:
                ' ${controller.invoice.value.hours.toString()} ${'invoice.hours'.tr}',
            titleColor: AppColor.blueTextColor,
            titleFontWeight: FontWeight.w500,
            type: OrderInfoViewType.Text,
            value: controller.invoice.value.workingTime ?? ''),
      ]),
    );
  }

  Widget buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: _buildTitleSection(
                    title: 'invoice.detail.payment_method'.tr)),
            Expanded(
              child: Text(
                  PaymentMethod
                      .values[controller.invoice.value.paymentType ??
                          PaymentMethod.Banking.index]
                      .name,
                  textAlign: TextAlign.right,
                  style: TextAppStyle().normalTextStype()),
            )
          ],
        ),
      ]),
    );
  }

  Widget buildOrderDetail() {
    final totalTmp = controller.invoice.value.tmpTotal ?? 0;
    final shipFee = controller.invoice.value.travelingCosts ?? 0;
    final voucher = controller.invoice.value.voucher ?? 0;
    final total = controller.invoice.value.total ?? 0;
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildDetailItem(
                  title: 'order.detail.total_pay'.tr,
                  value: '$totalTmp JPY',
                  type: OrderInfoViewType.Text),
              if (controller.invoice.value.travelingCosts != null &&
                  controller.invoice.value.travelingCosts != 0)
                _buildDetailItem(
                    title: 'order.detail.ship_fee'.tr,
                    value: '$shipFee JPY',
                    type: OrderInfoViewType.Text),
              if (controller.invoice.value.voucher != null &&
                  controller.invoice.value.voucher != 0)
                _buildDetailItem(
                    title: 'order.detail.voucher'.tr,
                    value: '$voucher JPY',
                    type: OrderInfoViewType.Text),
              if (controller.invoice.value.expandPeriod != null &&
                  controller.invoice.value.expandPeriod!.isNotEmpty)
                _buildDetailItem(
                    title: 'order.detail.extend'.tr,
                    value: '',
                    type: OrderInfoViewType.Button),
              if (controller.showExtend.value == 1)
                Container(
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.invoice.value.expandPeriod!.length,
                        (index) => _buildDetailItem(
                            title:
                                'Lần ${controller.invoice.value.expandPeriod![index].times}:',
                            value:
                                '${controller.invoice.value.expandPeriod![index].minutes} phút - ${controller.invoice.value.expandPeriod![index].price} JPY',
                            type: OrderInfoViewType.Text),
                      ),
                    ],
                  ),
                ),
              _buildDetailItem(
                  title: 'order.detail.pay_value'.tr,
                  sizeTitle: 14,
                  colorTitle: Colors.black,
                  value: '$total JPY',
                  fweightValue: FontWeight.bold,
                  colorValue: AppColor.blueTextColor,
                  type: OrderInfoViewType.Text),
            ],
          ),
        ));
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
                  onTap: () {
                    controller.showExtend.value =
                        controller.showExtend.value == 1 ? 0 : 1;
                  },
                  child: SvgPicture.asset(controller.showExtend.value == 1
                      ? IconConstants.icDownBtn
                      : IconConstants.icRight))
        ],
      ),
    );
  }

  Widget buildActionBtnBottom(InvoiceStatus? status) {
    switch (status) {
      case InvoiceStatus.Accepted:
        return _btnAcceptedStatus();
      case InvoiceStatus.Canceled:
        return _btnCancelStatus();
      case InvoiceStatus.Successed:
        return _btnSuccessStatus();
      default:
        return Container();
    }
  }

  Widget _btnCancelStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GeneralButton(
        onPressed: () => controller.changeSupplierRequest(),
        borderRadius: BorderRadius.circular(24),
        borderColor: AppColor.primaryColorLight,
        backgroundColor: AppColor.primaryColorLight,
        child: Text(
          'order.detail.requied_repeat'.tr,
          style: TextAppStyle().titleButtonStyle(),
        ),
      ),
    );
  }

  Widget _btnAcceptedStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GeneralButton(
              onPressed: () {
                controller.cancel();
              },
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              child: Text(
                'order.detail.cancel_act'.tr,
                style: TextAppStyle().normalTextPink(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GeneralButton(
              onPressed: () {
                controller.editRequest();
              },
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              child: Text(
                'order.detail.edit'.tr,
                style: TextAppStyle().normalTextWhite(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnSuccessStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GeneralButton(
              onPressed: () {
                controller.onExtend();
              },
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              child: Text(
                'order.detail.extend'.tr,
                style: TextAppStyle().normalTextPink(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GeneralButton(
              onPressed: () {
                controller.onRating();
              },
              borderRadius: BorderRadius.circular(24),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              child: Text(
                'order.detail.rating'.tr,
                style: TextAppStyle().normalTextWhite(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCancelReason() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Container(color: AppColor.greyBackgroundColor, height: 4),
          const SizedBox(height: 18),
          _buildTitleSection(title: 'order.detail.cancel_reason'.tr),
          Text(
            controller.invoice.value.cancel!.reason ?? '',
            style: TextAppStyle().genaralTextStyle(),
          ),
        ],
      ),
    );
  }
}
