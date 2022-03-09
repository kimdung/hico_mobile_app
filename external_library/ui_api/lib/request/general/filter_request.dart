import 'package:json_annotation/json_annotation.dart';

part 'filter_request.g.dart';

@JsonSerializable()
class FilterRequest {
  final int limit;
  final int offset;

  FilterRequest(
    this.limit,
    this.offset,
  );

  factory FilterRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FilterRequestToJson(this);
}
