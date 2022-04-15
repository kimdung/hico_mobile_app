part of 'booking_detail_screen.dart';

extension BookingDetailChildren on BookingDetailScreen {
  Widget _buildExtendConfirmButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
      child: Expanded(
        child: GeneralButton(
          backgroundColor: AppColor.primaryColorLight,
          onPressed: () {},
          borderRadius: BorderRadius.circular(24),
          borderColor: AppColor.primaryColorLight,
          child: Text(
            'booking.detail.confirm'.tr,
            style: TextAppStyle().titleButtonStyle(),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfor() {
    return Container(
      height: 75.0,
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16.0,
        bottom: 18.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'booking.detail.order_infor'.tr,
            style: TextAppStyle().textOrderInforStyle(),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(IconConstants.syncRetry),
            title: const Text(
              'Hình thức',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'SVN-Jeko',
              ),
            ),
            trailing: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: const Text(
                'Online',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'SVN-Jeko',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(
    Widget header,
    String icon,
    String content,
    Widget trailing,
    Color textColor,
  ) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          ListTile(
            dense: false,
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(icon),
            minLeadingWidth: 24.0,
            title: Text(
              content,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: textColor,
                fontFamily: 'SVN-Jeko',
              ),
            ),
            trailing: trailing,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceInfor() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'booking.detail.serivce_infor'.tr,
            style: TextAppStyle().textOrderInforStyle(),
          ),
          const SizedBox(height: 14.0),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 58.0,
              height: 58.0,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Image.asset(ImageConstants.medical),
            ),
            title: Text(
              'Y tế',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColor.textBlack,
                fontFamily: 'SVN-Jeko',
              ),
            ),
            subtitle: Text(
              'Khoa Xương khớp',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColor.textBlack,
                fontFamily: 'SVN-Jeko',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntoMoney() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 18.0,
        left: 20.0,
        right: 20.0,
        bottom: 34.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Tiền đơn hàng (Tạm tính)',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF717171),
                    fontFamily: 'SVN-Jeko',
                  ),
                ),
              ),
              Text(
                '${controller.result.money} JPY',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF717171),
                  fontFamily: 'SVN-Jeko',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thành tiền',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textBlack,
                  fontFamily: 'SVN-Jeko',
                ),
              ),
              Text(
                '${controller.result.money} JPY',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blueTextColor,
                  fontFamily: 'SVN-Jeko',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
