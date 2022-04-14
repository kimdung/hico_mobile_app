part of 'profile_screen.dart';

extension ProfileExtension on ProfileScreen {
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
    return InkWell(
      onTap: onPress,
      child: Container(
        //adding: EdgeInsets.all(15),
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
                child: FCoreImage(icon)),
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
      ),
    );
  }

  Widget buildImageList({
    required String title,
    required String firstImage,
    String? firstImageTitle,
    required String secondImage,
    String? secondImageTitle,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextAppStyle().genaralBlackTextStyle()),
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
            child: Row(
              children: [
                Expanded(
                  child: _buildImageItem(
                      image: firstImage, title: firstImageTitle),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildImageItem(
                      image: secondImage, title: secondImageTitle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageGrid({
    required String title,
    List<DocumentsCertificateModel>? list,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextAppStyle().genaralBlackTextStyle()),
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
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(
      {required String image,
      String? title,
      double? width,
      int? index,
      bool? padding = false}) {
    return Column(
      children: [
        Container(
          width: width ?? Get.width,
          padding: padding!
              ? const EdgeInsets.symmetric(horizontal: 5)
              : EdgeInsets.all(0),
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
}
