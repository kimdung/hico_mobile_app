part of 'time_extension_screen.dart';

extension TimeExtensionChildren on TimeExtensionScreen {
  Widget _buildExtendButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 24.0),
      child: Expanded(
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
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'SVN-Jeko',
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildExtendList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.extendList.length,
        itemBuilder: (context, index) {
          return ItemExtendWidget(index: index);
        },
      ),
    );
  }
}
