part of 'voucher_screen.dart';

extension VoucherComponent on VoucherScreen {
  Widget buidItem({required VoucherModel item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          controller.selected(item.id!);
        },
        child: Stack(
          children: [
            BoxDecorationWidget(
              shadow: true,
              height: 100,
              border: Border.all(
                  color: controller.voucherId.value == item.id
                      ? AppColor.primaryColorLight
                      : Colors.white),
              radius: controller.voucherId.value == item.id ? 6 : 0,
              color: controller.voucherId.value == item.id
                  ? AppColor.secondBackgroundColorLight
                  : AppColor.primaryBackgroundColorLight,
              child: Container(
                height: 100,
                child: Row(children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 13),
                        child: (item.displayImage != null)
                            ? NetWorkImage(
                                image: item.displayImage!,
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              )
                            : FCoreImage(
                                ImageConstants.imageDefault,
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AppColor.secondBackgroundColorLight,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 2),
                                child: Text(
                                  item.subtitle ?? '',
                                  style: TextAppStyle()
                                      .miniTextStype()
                                      .copyWith(
                                          color:
                                              AppColor.primaryTextColorLight),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: FCoreImage(
                                  IconConstants.icInfo,
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item.name ?? '',
                            maxLines: 1,
                            style: TextAppStyle().normalTextStype(),
                          ),
                          Text(
                            item.condition ?? '',
                            style: TextAppStyle().miniTextStype(),
                          ),
                          Text(
                            'HSD: ${item.startTime} - ${item.endTime}',
                            style: TextAppStyle().miniTextStype(),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
            if (controller.voucherId.value == item.id)
              Positioned(
                top: -8,
                left: 88,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColorLight),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // other arguments
                  ),
                ),
              ),
            if (controller.voucherId.value == item.id)
              Positioned(
                bottom: -8,
                left: 88,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColorLight),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // other arguments
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
