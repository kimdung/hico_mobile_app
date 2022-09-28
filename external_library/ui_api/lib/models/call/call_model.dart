import 'package:json_annotation/json_annotation.dart';

part 'call_model.g.dart';

@JsonSerializable()
class CallModel {
  String? id;
  int? callerId;
  int? invoiceId;
  String? callerName;
  String? callerPic;
  int? receiverId;
  String? receiverName;
  String? receiverPic;
  String? channelId;
  bool? isVideo;
  bool? hasDialled;

  CallModel({
    this.id,
    this.callerId,
    this.invoiceId,
    this.callerName,
    this.callerPic,
    this.receiverId,
    this.receiverName,
    this.receiverPic,
    this.channelId,
    this.isVideo,
    this.hasDialled,
  });

  factory CallModel.fromJson(Map<String, dynamic> json) =>
      _$CallModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallModelToJson(this);

  String? getImage() {
    return (hasDialled ?? false) ? receiverPic : callerPic;
  }

  String? getName() {
    return (hasDialled ?? false) ? receiverName : callerName;
  }

  int? getId() {
    return (hasDialled ?? false) ? callerId : receiverId;
  }
}
