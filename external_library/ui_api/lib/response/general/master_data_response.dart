import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'master_data_response.g.dart';

@JsonSerializable()
class MasterDataResponse extends BaseResponse {
  @JsonKey(name: 'data')
  MasterDataModel? masterDataModel;

  MasterDataResponse(this.masterDataModel);

  factory MasterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MasterDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MasterDataResponseToJson(this);
}
