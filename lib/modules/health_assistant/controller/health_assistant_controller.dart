import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/repository/gotrust_ui_repository.dart';
import 'package:ui_api/ui_api.dart';

import '../../../../resource/assets_constant/images_constants.dart';
import '../../../base/base_controller.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../../../shared/widgets/membership_card/membership_card_widget.dart';
import '../view/health_assistant_screen.dart';

class HealthAssistantController extends BaseController {
  final GotrustUIRepository _uiRepository;
  RxInt currentIndex = 0.obs;
  Rx<HomeScreenUiModel?> homeUIStream = Rx<HomeScreenUiModel?>(null);

  HealthAssistantController(this._uiRepository) {
    EasyLoading.show();

    _uiRepository.getHomeScreenUI().then((value) {
      print(value);
      homeUIStream.value = value;
      EasyLoading.dismiss();
    }).catchError(
      (onError) {
        EasyLoading.dismiss();
        doShowDialog(
          CommonDialogRequest(
            description: 'Có lỗi trong quá trình xử lý, vui lòng thử lại',
            // defineEvent: GET_DATA_ERROR,
            titleButton: 'OK',
          ),
        );
      },
    );
  }

  void getChange(int index) {
    currentIndex.value = index;
  }

  final test1 = MembershipCardModel(
      ImageConstants.bhMotoBanner,
      'Thẻ thành viên',
      'Nguyễn Văn A',
      'CMND: 123456789',
      ' 10/10/2021',
      '5294 2436 4780 2468');

  List<UIItem> getLstMenuHome() {
    return homeUIStream.value?.homeScreen.topFeature.items ?? [];
  }

  List<String> promotions() {
    final list = <String>[];
    for (var i = 0; i < 4; i++) {
      list.add(ImageConstants.bhMotoBanner);
    }
    return list;
  }

  List<CovenientServiceModel> getLstCovenientService() {
    final list = <CovenientServiceModel>[];
    final test =
        CovenientServiceModel(IconConstants.icService, 'Thẻ thành viên');
    for (var i = 0; i < 8; i++) {
      list.add(test);
    }
    return list;
  }

  List<ServiceCovidModel> getLstService() {
    final list = <ServiceCovidModel>[];
    final test =
        ServiceCovidModel(ImageConstants.bhMotoBanner, 'Thẻ thành viên');
    for (var i = 0; i < 2; i++) {
      list.add(test);
    }
    return list;
  }
}
