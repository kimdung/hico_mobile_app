part of 'time_extension_screen.dart';

extension TimeExtensionChildren on TimeExtensionScreen {
  Widget _buildExtendButton() {
    return Container(
      margin:
          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 24.0, top: 20),
      child: GeneralButton(
        backgroundColor: AppColor.primaryColorLight,
        onPressed: () {
          controller.onHandleExtendButton();
        },
        borderRadius: BorderRadius.circular(24),
        borderColor: AppColor.primaryColorLight,
        child: Text(
          'Gia hạn',
          style: TextAppStyle().titleButtonStyle(),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          right: 20.0,
          left: 20.0,
        ),
        leading: SvgPicture.asset(
          IconConstants.timeCircle,
          width: 20.0,
          height: 20.0,
        ),
        minLeadingWidth: 20.0,
        title: Text(
          'extend.header'.tr,
          style: TextAppStyle().smallTextBlack(),
        ),
      ),
    );
  }

  Widget buildExtendItem(ExtendPeriodModel item) {
    return InkWell(
      onTap: () {
        controller.selectExtend(item);
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: controller.currentIndex.value.id == item.id
                ? AppColor.secondBackgroundColorLight
                : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 0.0,
                color: const Color(0xFFFF7DA5).withOpacity(0.3),
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 18.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          width: double.infinity,
          child: Text(
            '${item.minutes} ${'invoice.minutes'.tr} - ${item.price} - JPY',
            style: TextAppStyle().normalTextPink(),
          ),
        ),
      ),
    );
  }
}
