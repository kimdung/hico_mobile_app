import 'package:json_annotation/json_annotation.dart';

part 'rating_request.g.dart';

@JsonSerializable()
class RatingRequest {
  @JsonKey(name: 'invoice_id')
  final int? invoiceId;
  @JsonKey(name: 'number_star')
  final int? numberStar;
  final String content;

  RatingRequest(this.invoiceId, this.numberStar, this.content);

  factory RatingRequest.fromJson(Map<String, dynamic> json) =>
      _$RatingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RatingRequestToJson(this);
}
