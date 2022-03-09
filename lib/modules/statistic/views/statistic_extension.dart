part of 'statistic_screen.dart';

extension StatisticExtension on StatisticScreen {
  Widget buildStatusNavBar() {
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.secondBackgroundColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(48)),
      ),
      child: Obx(() => Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.indexStatus.value = 0;
                  },
                  child: Container(
                    // height: 44,
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: (controller.indexStatus.value == 0)
                        ? BoxDecoration(
                            color: AppColor.primaryColorLight,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(48)),
                          )
                        : null,
                    child: Text(
                      'statistic.finish'.tr,
                      textAlign: TextAlign.center,
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            color: controller.indexStatus.value == 0
                                ? AppColor.secondTextColorLight
                                : AppColor.primaryTextColorLight,
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.indexStatus.value = 1;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: controller.indexStatus.value == 1
                        ? BoxDecoration(
                            color: AppColor.primaryColorLight,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(48)),
                          )
                        : null,
                    child: Text(
                      'statistic.cancel'.tr,
                      textAlign: TextAlign.center,
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            color: controller.indexStatus.value == 1
                                ? AppColor.secondTextColorLight
                                : AppColor.primaryTextColorLight,
                          ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildTotalWithStatus() {
    return Obx(() => Container(
          child: Container(
            child: controller.indexStatus.value == 0
                ? Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTotalItem(
                            margin: 1,
                            icon: IconConstants.icMoneyGreen,
                            title: 'statistic.finish_total'.tr,
                            price:
                                '${controller.completed.value.total ?? 0} JPY',
                            textColor: AppColor.blueTextColor),
                        _buildTotalItem(
                            margin: 2,
                            icon: IconConstants.icMoneyPink,
                            title: 'statistic.finish_paid'.tr,
                            price:
                                '${controller.completed.value.paid ?? 0} JPY',
                            textColor: AppColor.blueTextColor),
                      ],
                    ),
                    Row(
                      children: [
                        _buildTotalItem(
                            margin: 1,
                            icon: IconConstants.icMoneyGreen,
                            title: 'statistic.finish_remain'.tr,
                            price:
                                '${controller.completed.value.remain ?? 0} JPY',
                            textColor: AppColor.blueTextColor),
                      ],
                    )
                  ])
                : Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTotalItem(
                            margin: 1,
                            icon: IconConstants.icMoneyGreen,
                            title: 'statistic.cancel_total'.tr,
                            price:
                                '${controller.canceled.value.total ?? 0} JPY',
                            textColor: AppColor.blueTextColor),
                        _buildTotalItem(
                            margin: 2,
                            icon: IconConstants.icMoneyPink,
                            title: 'statistic.cancel_paid'.tr,
                            price: '${controller.canceled.value.paid ?? 0} JPY',
                            textColor: AppColor.blueTextColor),
                      ],
                    ),
                    Row(
                      children: [
                        _buildTotalItem(
                            margin: 1,
                            icon: IconConstants.icMoneyRed,
                            title: 'statistic.cancel_remain'.tr,
                            price:
                                '${controller.canceled.value.remain ?? 0} JPY',
                            textColor: AppColor.redTextColor),
                      ],
                    )
                  ]),

            // GridView.extent(
            //   primary: false,
            //   childAspectRatio: 160 / 60,
            //   crossAxisSpacing: 14,
            //   mainAxisSpacing: 0,
            //   maxCrossAxisExtent: 300.0,
            //   children: controller.indexStatus.value == 0
            //       ? <Widget>[
            //           _buildTotalItem(
            //               margin: 1,
            //               icon: IconConstants.icMoneyGreen,
            //               title: 'statistic.finish_total'.tr,
            //               price: '${controller.completed.value.total ?? 0} JPY',
            //               textColor: AppColor.blueTextColor),
            //           _buildTotalItem(
            //               margin: 2,
            //               icon: IconConstants.icMoneyPink,
            //               title: 'statistic.finish_paid'.tr,
            //               price: '${controller.completed.value.paid ?? 0} JPY',
            //               textColor: AppColor.blueTextColor),
            //           _buildTotalItem(
            //               margin: 1,
            //               icon: IconConstants.icMoneyGreen,
            //               title: 'statistic.finish_remain'.tr,
            //               price:
            //                   '${controller.completed.value.remain ?? 0} JPY',
            //               textColor: AppColor.blueTextColor),
            //         ]
            //       : <Widget>[
            //           _buildTotalItem(
            //               margin: 1,
            //               icon: IconConstants.icMoneyGreen,
            //               title: 'statistic.cancel_total'.tr,
            //               price: '${controller.canceled.value.total ?? 0} JPY',
            //               textColor: AppColor.blueTextColor),
            //           _buildTotalItem(
            //               margin: 2,
            //               icon: IconConstants.icMoneyPink,
            //               title: 'statistic.cancel_paid'.tr,
            //               price: '${controller.canceled.value.paid ?? 0} JPY',
            //               textColor: AppColor.blueTextColor),
            //           _buildTotalItem(
            //               margin: 1,
            //               icon: IconConstants.icMoneyRed,
            //               title: 'statistic.cancel_remain'.tr,
            //               price: '${controller.canceled.value.remain ?? 0} JPY',
            //               textColor: AppColor.redTextColor),
            //         ],
            // ),
          ),
        ));
  }

  Widget _buildTotalItem(
      {int? margin = 1,
      required String icon,
      required String title,
      required String price,
      Color? textColor}) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: (Get.width - 54) / 2,
      margin: margin == 1
          ? const EdgeInsets.only(left: 20, top: 18)
          : const EdgeInsets.only(right: 20, top: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondColorLight.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 11),
            child: FCoreImage(icon, width: 18),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextAppStyle().smallTextBlack(),
                ),
                Text(
                  price,
                  style: TextAppStyle().smallTextBlack().copyWith(
                        color: textColor ?? Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColor.primaryColorLight,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        onSubmitted: (value) {
          controller.loadInvoiceList();
        },
        cursorColor: AppColor.fifthTextColorLight,
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'order.search_title'.tr,
            hintStyle: TextAppStyle().normalTextPink(),
            prefixIcon: Image.asset(IconConstants.icSearch),
            contentPadding: const EdgeInsets.symmetric(vertical: 5)),
      ),
    );
  }

  Widget buildSearchDate(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _buildFromDateInput(context)),
          const SizedBox(width: 30),
          Expanded(child: _buildToDateInput(context)),
          const SizedBox(width: 30),
          Container(
            width: 71,
            child: GeneralButton(
              onPressed: () {
                controller.loadInvoiceList();
              },
              borderRadius: BorderRadius.circular(40),
              borderColor: AppColor.primaryColorLight,
              backgroundColor: AppColor.primaryColorLight,
              height: 35,
              child: Text(
                'statistic.select'.tr,
                style: TextAppStyle()
                    .smallTextStype()
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFromDateInput(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'statistic.from_date'.tr,
            style: TextAppStyle().normalTextStype(),
          ),
          const SizedBox(height: 8),
          Container(
            color: AppColor.secondBackgroundColorLight,
            height: 35,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectFromDate(context);
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller.fromDateController,
                      keyboardType: TextInputType.datetime,
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            color: AppColor.niceTextColorLight,
                          ),
                      decoration: InputDecoration(
                        hintText: controller.fromDate,
                        hintStyle: TextAppStyle().genaralTextStyle().copyWith(
                              color: AppColor.niceTextColorLight,
                            ),
                        contentPadding: const EdgeInsets.fromLTRB(8, -10, 0, 6),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 4,
                    right: 0,
                    width: 24,
                    child: FCoreImage(
                      IconConstants.icExpandMore,
                      width: 24,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildToDateInput(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'statistic.to_date'.tr,
            style: TextAppStyle().normalTextStype(),
          ),
          const SizedBox(height: 8),
          Container(
            color: AppColor.secondBackgroundColorLight,
            height: 35,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectToDate(context);
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller.toDateController,
                      keyboardType: TextInputType.datetime,
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            color: AppColor.niceTextColorLight,
                          ),
                      decoration: InputDecoration(
                        hintText: controller.toDate,
                        hintStyle: TextAppStyle().genaralTextStyle().copyWith(
                              color: AppColor.niceTextColorLight,
                            ),
                        contentPadding: const EdgeInsets.fromLTRB(8, -10, 0, 6),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 4,
                    right: 0,
                    width: 24,
                    child: FCoreImage(
                      IconConstants.icExpandMore,
                      width: 24,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildOrderList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.invoiceList.length,
          itemBuilder: (context, index) {
            return _buildOrderItem(item: controller.invoiceList[index]);
          })),
    );
  }

  Widget _buildOrderItem({required StatisticInvoiceModel item}) {
    return Container(
      //height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondColorLight.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: (item.supplierAvatar != null && item.supplierAvatar != '')
                  ? NetWorkImage(
                      image: item.supplierAvatar!,
                      height: 60,
                    )
                  : FCoreImage(
                      ImageConstants.imageDefault,
                      height: 60,
                    )),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'statistic.order_code'.tr,
                    style: TextAppStyle().smallTextPink(),
                  ),
                  Text(
                    item.code ?? '',
                    style: TextAppStyle().smallTextBlack(),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'statistic.amount'.tr,
                    style: TextAppStyle().smallTextPink(),
                  ),
                  Text(
                    '${item.total} JPY',
                    style: TextAppStyle().smallTextBlack(),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
