part of 'supplier_detail_screen.dart';

extension SupplierDetailComponents on SupplierDetailScreen {
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
            color: AppColor.borderGrayColorLight,
            width: 1,
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
                              image: list[index].url!,
                              padding: true,
                              width: (Get.width - 40) / 2)),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(
      {required String image,
      String? title,
      double? width,
      bool? padding = false}) {
    return Column(
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
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
}
