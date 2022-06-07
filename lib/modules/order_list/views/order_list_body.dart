part of 'order_list_screen.dart';

extension OrderListBody on OrderListScreen {
Widget buildHeaderBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault, vertical: 12),
      color: AppColor.secondBackgroundColorLight,
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.toNamed(Routes.PROFILE_UPDATE),
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
            onTap: () {
              controller.deposit();
            } ,
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
                controller.totalNotif.value == 0
                    ? Container()
                    : Positioned(
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColor.primaryColorLight),
                          child: Center(
                            child: Text(
                              controller.totalNotif.value.toString(),
                              style: AppTextStyle.secondTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.8,
            height: 50,
            child: Row(
              children: [
                if (controller.info.value.avatarImage != null &&
                    controller.info.value.avatarImage != '')
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_UPDATE);
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
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'order.hello'.tr,
                          style: AppTextStyle.secondTextStyle
                              .copyWith(color: AppColor.eightTextColorLight),
                        ),
                        Text(controller.info.value.name ?? '',
                            style: AppTextStyle.primaryTextStyle
                                .copyWith(color: AppColor.niceTextColorLight)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: controller.onChatAdmin,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: FCoreImage(
                    IconConstants.icChat,
                    height: 24,
                  ),
                ),
                controller.totalNotif.value == 0
                    ? Container()
                    : Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColor.primaryColorLight),
                          child: Center(
                            child: Text(
                              controller.totalNotif.value.toString(),
                              style: AppTextStyle.secondTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      color: AppColor.secondBackgroundColorLight,
      child: Stack(
        overflow: Overflow.visible,
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

  Widget _buildListOrder() {
    return Container(
      child: Column(
        children: [
          ...List.generate(
              controller.list.length,
              (index) => ItemOrderWidget(
                    invoice: controller.list[index],
                    onPress: () =>
                        controller.viewDetail(controller.list[index].id!),
                    onChat: () => controller.onChat(controller.list[index]),
                    onCall: () => controller.onCall(controller.list[index]),
                    onVideo: () => controller.onVideo(controller.list[index]),
                  ))
        ],
      ),
    );
  }

  // Widget _buildOrdertem() {
  //   return InkWell(
  //     onTap: () => controller.viewDetail(),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //       ),
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 14),
  //           Container(
  //             margin: EdgeInsets.only(bottom: 10),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(8),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: AppColor.secondColorLight.withOpacity(0.2),
  //                   spreadRadius: 3,
  //                   blurRadius: 7,
  //                   offset: Offset(0, 3),
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       flex: 2,
  //                       child: Container(
  //                         child: Image.asset(
  //                           ImageConstants.imageDefault,
  //                           width: 80,
  //                           height: 80,
  //                         ),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex: 3,
  //                       child: Container(
  //                         padding: const EdgeInsets.symmetric(vertical: 10),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Container(
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Container(
  //                                     child: Text(
  //                                       'MDH123456',
  //                                       style: AppTextStyle.primaryTextStyle
  //                                           .copyWith(
  //                                         fontWeight: FontWeight.w700,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                       padding: EdgeInsets.symmetric(
  //                                           horizontal: 12, vertical: 6),
  //                                       margin: EdgeInsets.only(right: 20),
  //                                       decoration: BoxDecoration(
  //                                           color: AppColor.onlineColor,
  //                                           borderRadius:
  //                                               BorderRadius.circular(18)),
  //                                       child: Text(
  //                                         'Online',
  //                                         style: AppTextStyle.primaryTextStyle
  //                                             .copyWith(
  //                                           color: Colors.white,
  //                                         ),
  //                                       ))
  //                                 ],
  //                               ),
  //                             ),
  //                             Text(
  //                               'Phạm Thành Nam',
  //                               style: AppTextStyle.primaryTextStyle.copyWith(
  //                                 color: Colors.black,
  //                                 fontWeight: FontWeight.w400,
  //                               ),
  //                             ),
  //                             const SizedBox(height: 5),
  //                             _buildAddressItem(
  //                                 icon: IconConstants.icAddress,
  //                                 title:
  //                                     '28 Phường Akita, Quận Akita, TP.Akita'),
  //                             const SizedBox(height: 5),
  //                             _buildAddressItem(
  //                                 icon: IconConstants.icTrain,
  //                                 title: 'Ga Akita'),
  //                             const SizedBox(height: 5),
  //                             _buildAddressItem(
  //                                 icon: IconConstants.icService,
  //                                 title: 'Tim mạch/Xương khớp'),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 controller.currentStatus == 1
  //                     ? Container(
  //                         height: 50,
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               child: _buildActionButton(
  //                                   onPress: () {
  //                                     print('chat');
  //                                   },
  //                                   icon: IconConstants.icChatColor,
  //                                   title: 'order.detail.chat'.tr,
  //                                   border: Border(
  //                                     right: BorderSide(
  //                                       color: AppColor.primaryColorLight,
  //                                       width: 0.5,
  //                                     ),
  //                                     top: BorderSide(
  //                                       color: AppColor.primaryColorLight,
  //                                       width: 0.5,
  //                                     ),
  //                                   )),
  //                             ),
  //                             Expanded(
  //                               child: _buildActionButton(
  //                                   onPress: () {},
  //                                   icon: IconConstants.icChatColor,
  //                                   title: 'order.detail.call'.tr,
  //                                   border: Border(
  //                                     right: BorderSide(
  //                                       color: AppColor.primaryColorLight,
  //                                       width: 0.5,
  //                                     ),
  //                                     top: BorderSide(
  //                                       color: AppColor.primaryColorLight,
  //                                       width: 0.5,
  //                                     ),
  //                                   )),
  //                             ),
  //                             Expanded(
  //                               child: _buildActionButton(
  //                                   onPress: () {},
  //                                   icon: IconConstants.icVideoCallColor,
  //                                   title: 'order.detail.video'.tr,
  //                                   border: Border(
  //                                     top: BorderSide(
  //                                       color: AppColor.primaryColorLight,
  //                                       width: 0.5,
  //                                     ),
  //                                   )),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     : new Container(),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAddressItem({required String icon, required String title}) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(right: 12),
  //         child: Image.asset(
  //           icon,
  //           width: 10,
  //         ),
  //       ),
  //       Expanded(
  //         child: Text(
  //           title,
  //           style: AppTextStyle.secondTextStyle.copyWith(
  //             color: AppColor.fourthTextColorLight,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _buildActionButton(
  //     {required String icon,
  //     required String title,
  //     required Border border,
  //     required Function()? onPress}) {
  //   return InkWell(
  //     onTap: onPress,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         border: border,
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(
  //             icon,
  //             width: 17,
  //           ),
  //           const SizedBox(height: 5),
  //           Text(
  //             title,
  //             style: AppTextStyle.secondTextStyle.copyWith(
  //               color: Colors.black,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
