import 'package:json_annotation/json_annotation.dart';
part 'user_time_model.g.dart';

@JsonSerializable()
class UserTimeModel {
  String? date;
  List<UserTimeListModel>? list;

  UserTimeModel({this.date, this.list});

  factory UserTimeModel.fromJson(Map<String, dynamic> json) =>
      _$UserTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTimeModelToJson(this);
}

@JsonSerializable()
class UserTimeListModel {
  int? id;
  String? date;
  @JsonKey(name: 'begin_time', defaultValue: '')
  String? beginTime;
  @JsonKey(name: 'end_time', defaultValue: '')
  String? endTime;

  UserTimeListModel({this.id, this.date, this.beginTime, this.endTime});

  factory UserTimeListModel.fromJson(Map<String, dynamic> json) =>
      _$UserTimeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTimeListModelToJson(this);
}
