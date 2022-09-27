part of 'booking_detail_screen.dart';

extension BookingDetailChildren on BookingDetailScreen {
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
                ' ${controller.result.value.extendPeriod!.minutes} ${'invoice.minutes'.tr}',
            titleColor: AppColor.blueTextColor,
            titleFontWeight: FontWeight.w500,
            type: OrderInfoViewType.Text,
            value: ''),
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
            Expanded(child: _buildTitleSection(title: 'booking.wallet'.tr)),
            Expanded(
              child: Text('${AppDataGlobal.userInfo!.accountBalance} JPY',
                  textAlign: TextAlign.right,
                  style: TextAppStyle().normalTextStype()),
            )
          ],
        ),
      ]),
    );
  }

  Widget buildOrderDetail() {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildDetailItem(
                  title: 'order.detail.total_pay'.tr,
                  value: '${controller.result.value.extendPeriod!.price!} JPY',
                  type: OrderInfoViewType.Text),
              _buildDetailItem(
                  title: 'order.detail.pay_value'.tr,
                  sizeTitle: 14,
                  colorTitle: Colors.black,
                  value: '${controller.result.value.extendPeriod!.price!} JPY',
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
          Text(value,
              style: TextAppStyle().genaralTextStyle().copyWith(
                    color: colorValue ?? AppColor.sixTextColorLight,
                    fontWeight: fweightValue ?? FontWeight.w500,
                    fontSize: sizeValue ?? 14,
                  ))
        ],
      ),
    );
  }
}
