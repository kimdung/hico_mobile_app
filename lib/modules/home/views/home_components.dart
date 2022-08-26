part of 'home_screen.dart';

extension HomeComponents on HomeScreen {
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
                      '${controller.userInfo.value.accountBalance ?? 0} JPY',
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
            },
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

  Widget buildSlider(List<SliderModel?> sliders) {
    if (sliders.isNotEmpty) {
      return Container(
        child: SliderWidget(
          ratio: 2,
          localImage: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.borderPinkColorLight.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          items: sliders
              .map((e) => SliderItem(
                    image: e!.displayImage!,
                    onpress: () => controller.routerSlider(e),
                  ))
              .toList(),
        ),
      );
    }
    return Container();
  }

  Widget buildServiceCategories({required String title}) {
    return Container(
      child: Column(
        children: [
          _buildSectionTitle(
              title: 'home.service_categories'.tr,
              onPress: () => Get.toNamed(Routes.SERVICE_CATEGORIES)),
          if (controller.homeModel.value.serviceCategories != null)
            _buildImageGrid(list: controller.homeModel.value.serviceCategories),
        ],
      ),
    );
  }

  Widget buildServiceList(
      {required String title,
      Function()? onPress,
      required List<ServiceModel>? list}) {
    return Container(
      child: Column(
        children: [
          _buildSectionTitle(title: title, onPress: onPress),
          const SizedBox(height: 12),
          if (list != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        list.length,
                        (index) => _buildServiceItem(
                              item: list[index],
                              id: list[index].id!,
                              image: list[index].displayImage!,
                              name: list[index].name!,
                              price: list[index].price!,
                            ))
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget buildSupplierList(
      {required String title,
      Function()? onPress,
      required List<SupplierInfoModel>? list}) {
    return Container(
      child: Column(
        children: [
          _buildSectionTitle(title: title, onPress: onPress),
          const SizedBox(height: 12),
          if (list != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(list.length,
                        (index) => _buildSupplierItem(item: list[index]))
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget buildBannerHome() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault),
      child: BoxDecorationWidget(
        height: (Get.width - (CommonConstants.paddingDefault * 2)) / 3,
        shadow: true,
        shadowColor: AppColor.borderPinkColorLight.withOpacity(0.5),
        radius: 10,
        child: InkWell(
          onTap: controller.registerConsulting,
          child: NetWorkImage(
            image: controller.homeModel.value.bannerHome!,
            width: Get.width,
            radius: 12,
            height: (Get.width - (CommonConstants.paddingDefault * 2)) / 3,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget buildNewsList() {
    return Container(
      child: Column(
        children: [
          _buildSectionTitle(
            title: 'home.news'.tr,
            onPress: () {
              controller.viewAllNews();
            },
          ),
          const SizedBox(height: 12),
          if (controller.homeModel.value.news != null)
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.paddingDefault),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        controller.homeModel.value.news!.length,
                        (index) => _buildNewsItem(
                          id: controller.homeModel.value.news![index].id!,
                          image: controller
                              .homeModel.value.news![index].displayImage!,
                          date: controller
                              .homeModel.value.news![index].createdAt!,
                          title: controller.homeModel.value.news![index].title!,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildServiceItem(
      {required ServiceModel item,
      required int id,
      required String image,
      required String name,
      required int price}) {
    return InkWell(
      onTap: () {
        controller.viewService(item);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              width: (Get.width - 72) / 2.7,
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.borderPinkColorLight),
                borderRadius: BorderRadius.circular(8),
              ),
              child: NetWorkImage(image: image, height: 48),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: TextAppStyle().secondTextStyle().copyWith(
                    color: Colors.black,
                  ),
            ),
            Text(
              '$price JPY/30 ${'invoice.minutes'.tr}',
              style: TextAppStyle()
                  .secondTextStyle()
                  .copyWith(color: AppColor.blueTextColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSupplierItem({required SupplierInfoModel item}) {
    final width = (Get.width - 60) / 2;
    return InkWell(
      onTap: () {
        controller.supplierDetail(item);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x19000000)),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: width,
              height: width,
              child: NetWorkImage(
                image: item.avatarImage ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.name ?? '',
              style: TextAppStyle().smallTextBlack(),
            ),
            Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      IconConstants.icSuccessOrder,
                      width: 15,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${item.taskCompleteNumber} ${'supplier.detail.complete'.tr}',
                    style: TextAppStyle().smallTextGrey(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid({
    List<ServiceCategoryModel>? list,
  }) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: list != null
                ? Wrap(
                    children: [
                      ...List.generate(
                          list.length,
                          (index) => ServiceItem(
                              image: list[index].displayImage!,
                              title: list[index].name!,
                              padding: true,
                              onPress: () {
                                controller.viewDetail(list[index].id!);
                              },
                              width: (Get.width - 88) / 3)),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(
      {required int id,
      required String image,
      required String date,
      required String title}) {
    return Container(
      width: (Get.width - (CommonConstants.paddingDefault * 2) - 16) * 0.7,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              controller.viewNews(id);
            },
            child: NetWorkImage(
              image: image,
              height: 155,
              fit: BoxFit.cover,
              radius: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: TextAppStyle().secondTextStyle(),
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: () {
              controller.viewNews(id);
            },
            child: Text(
              title,
              style: TextAppStyle().genaralBlackTextStyle(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle({required String title, Function()? onPress}) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextAppStyle().titleAppBarStyle(),
          ),
          InkWell(
            onTap: onPress,
            child: Text(
              'home.view_all'.tr,
              style: TextAppStyle()
                  .secondTextStyle()
                  .copyWith(color: AppColor.primaryTextColorLight),
            ),
          )
        ],
      ),
    );
  }
}
