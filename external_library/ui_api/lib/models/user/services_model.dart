import 'package:json_annotation/json_annotation.dart';
part 'services_model.g.dart';

@JsonSerializable()
class ServicesModel {
  int? serviceCategoryId;
  String? name;
  List<ServicesListModel>? list;

  ServicesModel({this.serviceCategoryId, this.name, this.list});

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);
}

@JsonSerializable()
class ServicesListModel {
  int? id;
  String? name;
  int? isOnline;
  int? isOffline;

  ServicesListModel({this.id, this.name, this.isOnline, this.isOffline});

  factory ServicesListModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesListModelToJson(this);
}
