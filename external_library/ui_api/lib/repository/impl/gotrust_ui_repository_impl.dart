import 'package:ui_api/datasource/remote/gotrust_ui_api.dart';
import 'package:ui_api/models/profile_screen_ui_model.dart';

import 'package:ui_api/models/membership_card_ui_model.dart';

import 'package:ui_api/models/home_screen_ui_model.dart';

import 'package:ui_api/models/family_doctor_ui_model.dart';

import '../gotrust_ui_repository.dart';

class GotrustUIRepositoryImpl extends GotrustUIRepository {
  final GotrustUIAPI _api;

  GotrustUIRepositoryImpl(this._api);

  @override
  Future<FamilyDoctorUiModel> getFamilyDoctorUI() {
    return _api.getFamilyDoctorUI();
  }

  @override
  Future<HomeScreenUiModel> getHomeScreenUI() {
    return _api.getHomeScreenUI();
  }

  @override
  Future<MembershipCardUIModel> getMembershipCardUI() {
    return _api.getMembershipCardUI();
  }

  @override
  Future<ProfileUIModel> getProfileScreenUI() {
    return _api.getProfileScreenUI();
  }
}
