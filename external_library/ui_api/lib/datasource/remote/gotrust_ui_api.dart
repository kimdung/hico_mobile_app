import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ui_api/models/family_doctor_ui_model.dart';
import 'package:ui_api/models/home_screen_ui_model.dart';
import 'package:ui_api/models/membership_card_ui_model.dart';
import 'package:ui_api/models/profile_screen_ui_model.dart';

part 'gotrust_ui_api.g.dart';

@RestApi()
abstract class GotrustUIAPI {
  factory GotrustUIAPI(Dio dio, {String baseUrl}) = _GotrustUIAPI;

  @GET('/medicalUI/Screen/F05.01?format=json')
  Future<HomeScreenUiModel> getHomeScreenUI();

  @GET('/medicalUI/Screen/F05.03?format=json')
  Future<MembershipCardUIModel> getMembershipCardUI();

  @GET('/medicalUI/Screen/F05.05?format=json')
  Future<ProfileUIModel> getProfileScreenUI();

  @GET('/medicalUI/Screen/F05.13?format=json')
  Future<FamilyDoctorUiModel> getFamilyDoctorUI();
}
