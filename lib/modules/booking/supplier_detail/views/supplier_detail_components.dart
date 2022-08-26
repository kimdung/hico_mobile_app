part of 'supplier_detail_screen.dart';

extension BookingSupplierDetailComponents on BookingSupplierDetailScreen {
  Widget buildGeneralInfo() {
    return Row(
      children: [
        if (controller.profile.value.avatarImage != null)
          NetWorkImage(
            image: controller.profile.value.avatarImage!,
            width: 117,
            height: 126,
            fit: BoxFit.cover,
            radius: 8,
          ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                controller.profile.value.name ?? '',
                style: TextAppStyle().largeTextPink(),
              ),
              const SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRateItem(
                    image: 'lib/resource/assets_resources/images/star.png',
                    value: controller.profile.value.avgRating ?? '',
                    title: 'supplier.detail.rate'.tr,
                  ),
                  _buildRateItem(
                    image: 'lib/resource/assets_resources/images/shield.png',
                    value:
                        controller.profile.value.taskCompleteNumber.toString(),
                    title: 'supplier.detail.complete'.tr,
                  ),
                  _buildRateItem(
                    image: 'lib/resource/assets_resources/images/people.png',
                    value: controller.profile.value.totalCustomer.toString(),
                    title: 'supplier.detail.customer'.tr,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildItem({
    required String icon,
    required String title,
    required String description,
    String? description2,
    String? description3,
    String? description4,
    Function()? onPress,
    Color? titleColor,
    int? allowArrow = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColor.primaryColorLight,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14, top: 4),
            child: FCoreImage(
              icon,
              width: 24,
              height: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextAppStyle().genaralTextStyle().copyWith(
                        color: titleColor ?? Colors.black,
                      ),
                ),
                Container(
                  child: Text(
                    description,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: titleColor ?? AppColor.eightTextColorLight,
                        ),
                  ),
                ),
                if (description2 != null)
                  Text(
                    description2,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: titleColor ?? AppColor.eightTextColorLight,
                        ),
                  ),
                if (description3 != null)
                  Text(
                    description3,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: titleColor ?? AppColor.eightTextColorLight,
                        ),
                  ),
                if (description4 != null)
                  Text(
                    description4,
                    style: TextAppStyle().genaralTextStyle().copyWith(
                          color: titleColor ?? AppColor.eightTextColorLight,
                        ),
                  ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageGrid({
    required String title,
    required String icon,
    List<DocumentsCertificateModel>? list,
  }) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 14, top: 4),
                  child: FCoreImage(
                    icon,
                    width: 24,
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                      style: TextAppStyle().genaralBlackTextStyle()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColor.borderGrayColorLight,
                  width: 1,
                ),
              ),
            ),
            child: list != null
                ? Wrap(
                    children: [
                      ...List.generate(
                        list.length,
                        (index) => _buildImageItem(
                            onpress: () =>
                                controller.openLink(list[index].url!),
                            image: list[index].extension == 'pdf'
                                ? 'lib/resource/assets_resources/images/pdf_icon.jpeg'
                                : list[index].url!,
                            padding: true,
                            file: list[index].extension == 'pdf' ? true : false,
                            width: (Get.width - 40) / 2),
                      ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem({
    required String image,
    String? title,
    double? width,
    bool? file = false,
    bool? padding = false,
    Function()? onpress,
  }) {
    return InkWell(
      onTap: onpress,
      child: Container(
        child: Column(
          children: [
            Container(
              width: width ?? Get.width,
              padding: padding!
                  ? const EdgeInsets.symmetric(horizontal: 5)
                  : const EdgeInsets.all(0),
              height: 119,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: file == false
                    ? CachedNetworkImage(
                        imageUrl: image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
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
                      )
                    : FCoreImage(
                        image,
                      ),
              ),
            ),
            if (title != null)
              Text(
                title,
                style: TextAppStyle().genaralTextStyle(),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildRateItem(
      {required String image, required String value, required String title}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: FCoreImage(image),
          ),
          Text(
            value,
            style: TextAppStyle().smallTextBlack(),
          ),
          Text(
            title,
            style: TextAppStyle().smallTextGrey(),
          )
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
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextAppStyle().normalTextStype()),
    );
  }

  Widget buildListService() {
    return Container(
      child: Column(
        children: [
          //Service
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColor.primaryColorLight,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14, top: 4),
                  child: FCoreImage(
                    'lib/resource/assets_resources/images/diploma.png',
                    //IconConstants.icProfileDiploma,
                    width: 20,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleComponent(
                          title: 'service'.tr, prefixIcon: false),
                      const SizedBox(height: 9),
                      Container(
                        child: controller.profile.value.customServices != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                      controller
                                          .profile.value.customServices!.length,
                                      (index) => buildServiceItem(
                                          item: controller.profile.value
                                              .customServices![index]))
                                ],
                              )
                            : Container(),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          //Address
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColor.primaryColorLight,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14, top: 4),
                  child: FCoreImage(
                    IconConstants.icMap,
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      buildTitleComponent(
                          title: 'supplier.filter.location'.tr,
                          prefixIcon: false),
                      const SizedBox(height: 9),
                      Container(
                        child: controller.profile.value.customWorkplaces != null
                            ? Column(
                                children: [
                                  ...List.generate(
                                      controller.profile.value.customWorkplaces!
                                          .length,
                                      (index) => buildAddressItem(
                                          workplacesItem: controller.profile
                                              .value.customWorkplaces![index]))
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          //User time
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColor.primaryColorLight,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14, top: 4),
                  child: FCoreImage(
                    IconConstants.timeCircle,
                    width: 20,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      buildTitleComponent(
                          title: 'service.time_slot'.tr, prefixIcon: false),
                      const SizedBox(height: 9),
                      Container(
                        child: controller.profile.value.userTime != null
                            ? Column(
                                children: [
                                  ...List.generate(
                                      controller.profile.value.userTime!.length,
                                      (index) => buildTimeItem(
                                          timeItem: controller
                                              .profile.value.userTime![index]))
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildServiceItem({required UserServicesCategoryModel item}) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'service'.tr} ${item.name}',
                style: TextAppStyle().normalTextPink(),
              ),
              InkWell(
                onTap: () {
                  controller.changeServiceArrow(item);
                },
                child: FCoreImage(
                  item.openChild!
                      ? IconConstants.icArrowDown
                      : IconConstants.icArrowForwardIos,
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            child: item.openChild! && item.list!.isNotEmpty
                ? Column(
                    children: [
                      ...List.generate(
                          item.list!.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.list![index].name ?? '',
                                        style: TextAppStyle().normalTextStype(),
                                      ),
                                    ),
                                    Text(
                                      'Onl',
                                      style: item.list![index].isOnline == 1
                                          ? TextAppStyle().normalTextPink()
                                          : TextAppStyle().normalTextWhite(),
                                    ),
                                    const SizedBox(width: 14),
                                    Text(
                                      'Off',
                                      style: item.list![index].isOffline == 1
                                          ? TextAppStyle().normalTextPink()
                                          : TextAppStyle().normalTextWhite(),
                                    ),
                                  ],
                                ),
                              ))
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildAddressItem({required WorkplacesModel workplacesItem}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                workplacesItem.name ?? '',
                style: TextAppStyle().normalTextPink(),
              ),
              InkWell(
                onTap: () {
                  controller.changeArrow(workplacesItem);
                },
                child: FCoreImage(
                  workplacesItem.openChild!
                      ? IconConstants.icArrowDown
                      : IconConstants.icArrowForwardIos,
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Container(
            child: workplacesItem.openChild! &&
                    workplacesItem.districts!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        workplacesItem.districts!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            workplacesItem.districts![index].name ?? '',
                            style: TextAppStyle().normalTextStype(),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
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
}
