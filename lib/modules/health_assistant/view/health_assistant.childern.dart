part of 'health_assistant_screen.dart';

extension _HealthAssistantChildern on HealthAssistantScreen {
  Widget _servicePackage({required UIItem servicePackage}) {
    return Container(
      width: (Get.width - 32 - 15) / 2,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: Get.width,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: 50, left: 40, right: 40, bottom: 12),
                child: Text(servicePackage.name ?? '',
                    textAlign: TextAlign.center,
                    style: TextAppStyle().textServicePackageTitleStyle()),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppColor.secondBackgroundColorLight,
                borderRadius: BorderRadius.circular(23.0),
              ),
              height: 46,
              width: 46,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23.0),
                child: Container(
                  color: AppColor.doctorServiceColor,
                  child: FCoreImage(
                    servicePackage.icon ?? IconConstants.goTrustCare,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _menuHome({required List<UIItem> lstMenuHome}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 12,
            spacing: 15,
            children: List<Widget>.generate(
              lstMenuHome.length,
              (index) {
                return InkWell(
                    onTap: () {
                      if (index == 0) {
                        // Get.toNamed(Routes.OnLINE_COUNSELING_SCREEN);
                      } else if (index == 1) {
                        // Get.toNamed(Routes.BOOK_ONLINE_SCREEN);
                      } else if (index == 3) {
                        // Get.toNamed(Routes.PRESCRIPTIONH_ISTORY);
                      }
                    },
                    child: _servicePackage(servicePackage: lstMenuHome[index]));
              },
            ),
          ),
          Positioned.fill(
            child: Align(
              child: _typeCustom(),
            ),
          )
        ],
      ),
    );
  }

  Widget _typeCustom() {
    return Container(
        height: 88,
        width: 88,
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: AppColor.typeCustomerColor,
          borderRadius: BorderRadius.circular(44.0),
        ),
        child: CircleAvatar(
          backgroundColor: AppColor.myHeartColor,
          child: FCoreImage(IconConstants.icMyheart),
        ));
  }

  Widget _serviceCovid({required ServiceCovidModel serviceCovid}) {
    return Container(
      width: (Get.width - 48) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FCoreImage(
              serviceCovid.iconBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Text(serviceCovid.title,
                      textAlign: TextAlign.center,
                      style: TextAppStyle().textServiceCovidStyle())),
            ),
          )
        ],
      ),
    );
  }

  Widget _covenientService({required CovenientServiceModel covenientServic}) {
    return Container(
        width: (Get.width - 64) / 3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FCoreImage(
              covenientServic.icon,
              height: 30,
              width: 30,
            ),
            const SizedBox(height: 8),
            Text(covenientServic.title,
                textAlign: TextAlign.center,
                style: TextAppStyle().textCovenientServiceStyle())
          ],
        ));
  }

  Widget _seeMore() {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.FAQ_SCREEN);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.secondTextColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        width: (Get.width - 64) / 3,
        child: Column(children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColor.color45C152.withOpacity(0.2),
                  AppColor.color0ADC90.withOpacity(0.2),
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.more_horiz_outlined,
                color: AppColor.eightTextColorLight,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('Dịch vụ khác',
              textAlign: TextAlign.center,
              style: TextAppStyle().textTitleProductStyle()),
        ]),
      ),
    );
  }

  Widget _footerHome() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Dịch vụ được cúng cấp theo ',
              style: TextAppStyle().textfooterStyle(),
            ),
            TextSpan(
              text: 'Điều khoản và chính sách ',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColor.eightTextColorLight,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
                text: 'đã đăng ký với Bộ Công Thương',
                style: TextAppStyle().textfooterStyle()),
          ],
        ),
      ),
    );
  }
}

class CovenientServiceModel {
  final String icon;
  final String title;
  CovenientServiceModel(this.icon, this.title);
}

class ServicePackageModel {
  final String iconImage;
  final String title;
  ServicePackageModel(this.iconImage, this.title);
}

class PromotionsModel {
  final String iconImage;
  PromotionsModel(this.iconImage);
}

class ServiceCovidModel {
  final String iconBackground;
  final String title;
  ServiceCovidModel(this.iconBackground, this.title);
}
