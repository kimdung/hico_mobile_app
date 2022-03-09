part of 'notification_screen.dart';

extension NotificationExtension on NotificationScreen {
  Widget buildEmptyPage() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FCoreImage(
              ImageConstants.notifyEmpty,
              width: 110,
            ),
            const SizedBox(height: 18),
            Text('notification.empty'.tr,
                style: TextAppStyle().genaralTextStyle()),
          ],
        ),
      ),
    );
  }

  Widget buildItemNotification({
    required NotificationModel item,
  }) {
    return InkWell(
      onTap: () {
        controller.viewDetail(item.id!);
      },
      child: Container(
        width: Get.width,
        color: item.isRead == 0
            ? AppColor.secondBackgroundColorLight
            : AppColor.primaryBackgroundColorLight,
        margin: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, right: 30, bottom: 20, left: 20),
              child: (item.displayImage != null && item.displayImage != '')
                  ? NetWorkImage(
                      image: item.displayImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(width: 60),
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
                            color: AppColor.primaryColorLight,
                          ),
                    ),
                    Text(item.description ?? '',
                        style: TextAppStyle().secondTextStyle()),
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
