part of 'news_screen.dart';

extension NewsExtension on NewsScreen {
  Widget buildItemNews({
    required NewsModel item,
  }) {
    return InkWell(
      onTap: () {
        controller.viewDetail(item.id!);
      },
      child: Container(
        width: Get.width,
        color: AppColor.primaryBackgroundColorLight,
        margin: const EdgeInsets.only(top: 24),
        child: Row(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 0, right: 30, bottom: 0, left: 20),
              child: (item.displayImage != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: 120,
                        height: 120,
                        imageUrl: item.displayImage!,
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
                      ))
                  : const SizedBox(width: 120),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? '',
                      style: TextAppStyle().genaralTextStyle().copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(item.description ?? '',
                        style: TextAppStyle().secondTextStyle()),
                    const SizedBox(height: 12),
                    Text(item.createdAt ?? '',
                        style: TextAppStyle().secondTextStyle()),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
