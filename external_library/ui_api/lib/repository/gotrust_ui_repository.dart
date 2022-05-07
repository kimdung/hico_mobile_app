import '../ui_api.dart';

abstract class GotrustUIRepository {
  Future<HomeScreenUiModel> getHomeScreenUI();

  Future<MembershipCardUIModel> getMembershipCardUI();

  Future<ProfileUIModel> getProfileScreenUI();

  Future<FamilyDoctorUiModel> getFamilyDoctorUI();
}
