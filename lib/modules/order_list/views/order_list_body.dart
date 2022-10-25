part of 'order_list_screen.dart';

extension OrderListBody on OrderListScreen {
  Widget _buildHeaderBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault, vertical: 12),
      color: AppColor.secondBackgroundColorLight,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.viewProfile;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                width: 42,
                height: 42,
                imageUrl: AppDataGlobal.userInfo?.avatarImage ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'order.hello'.tr,
                  style: AppTextStyle.secondTextStyle
                      .copyWith(color: AppColor.eightTextColorLight),
                ),
                Text(
                  AppDataGlobal.userInfo!.name!,
                  style: AppTextStyle.primaryTextStyle
                      .copyWith(color: AppColor.niceTextColorLight),
                ),
                Row(
                  children: [
                    FCoreImage(
                      IconConstants.icWallet,
                      width: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${controller.info.value.accountBalance ?? 0} JPY',
                      style: TextAppStyle().smallTextPink(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          InkWell(
            onTap: controller.deposit,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: FCoreImage(
                IconConstants.icWallet2,
                height: 24,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.SEARCH);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: FCoreImage(
                IconConstants.icSearchBlack,
                height: 24,
              ),
            ),
          ),
          InkWell(
            onTap: controller.onChatAdmin,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: FCoreImage(
                    IconConstants.icChat,
                    height: 24,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() =>
                      BadgeWidget(badge: controller.badgeChatAdmin.value)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      color: AppColor.secondBackgroundColorLight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 46,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
          ),
          Positioned(
            top: -22,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              width: Get.width,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColor.primaryColorLight,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onSubmitted: controller.onSearch,
                onChanged: controller.onChangeSearch,
                cursorColor: AppColor.primaryColorLight,
                style: TextAppStyle().smallTextPink(),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'order.search_title'.tr,
                  prefixIcon: Image.asset(IconConstants.icSearch),
                  contentPadding: const EdgeInsets.symmetric(vertical: 6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 35,
        width: Get.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.invoiceStatus.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(() {
                final status = controller.invoiceStatus[index];
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: ButtonScale(
                    onPressed: () => controller.selectStatus(status),
                    borderRadius: BorderRadius.circular(40),
                    borderColor: AppColor.primaryColorLight,
                    backgroundColor: status == controller.currentStatus.value
                        ? AppColor.primaryColorLight
                        : AppColor.primaryBackgroundColorLight,
                    height: 35,
                    child: Text(
                      controller.invoiceStatus[index].name.tr,
                      style: TextAppStyle().titleButtonStyle().copyWith(
                            fontSize: 14,
                            color: status == controller.currentStatus.value
                                ? Colors.white
                                : AppColor.primaryTextColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                );
              });
            }),
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 35,
        width: Get.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.invoiceStatus.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    controller.selectStatus(controller.invoiceStatus[index]),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: controller.invoiceStatus[index] ==
                                controller.currentStatus.value
                            ? AppColor.primaryColorLight
                            : AppColor.borderPinkColorLight,
                        width: controller.invoiceStatus[index] ==
                                controller.currentStatus.value
                            ? 2
                            : 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: index == (controller.invoiceStatus.length - 1)
                              ? null
                              : const Border(
                                  right: BorderSide(
                                    color: Color(0xFFDCDCDC),
                                    width: 1,
                                  ),
                                ),
                        ),
                        child: Text(
                          controller.invoiceStatus[index].name.tr,
                          textAlign: TextAlign.center,
                          style: TextAppStyle().normalTextGrey().copyWith(
                                color: controller.invoiceStatus[index] ==
                                        controller.currentStatus.value
                                    ? Colors.black
                                    : const Color(0xFF4E4E4E),
                                fontWeight: controller.invoiceStatus[index] ==
                                        controller.currentStatus.value
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                              ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildListOrder() {
    return ListView.separated(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list.length,
      itemBuilder: (context, index) => ItemOrderWidget(
        invoice: controller.list[index],
        onPress: () => controller.viewDetail(controller.list[index].id!),
        onChat: () => controller.onChat(controller.list[index]),
        onCall: () => controller.onCall(controller.list[index]),
        onVideo: () => controller.onVideo(controller.list[index]),
      ),
      separatorBuilder: (context, index) => Container(),
    );
    // return Container(
    //   child: Column(
    //     children: [
    //       ...List.generate(
    //           controller.list.length,
    //           (index) => ItemOrderWidget(
    //                 invoice: controller.list[index],
    //                 onPress: () =>
    //                     controller.viewDetail(controller.list[index].id!),
    //                 onChat: () => controller.onChat(controller.list[index]),
    //                 onCall: () => controller.onCall(controller.list[index]),
    //                 onVideo: () => controller.onVideo(controller.list[index]),
    //               ))
    //     ],
    //   ),
    // );
  }
}
