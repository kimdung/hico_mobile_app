// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallModel _$CallModelFromJson(Map<String, dynamic> json) => CallModel(
      callerId: json['callerId'] as int?,
      callerName: json['callerName'] as String?,
      callerPic: json['callerPic'] as String?,
      receiverId: json['receiverId'] as int?,
      receiverName: json['receiverName'] as String?,
      receiverPic: json['receiverPic'] as String?,
      channelId: json['channelId'] as String?,
      isVideo: json['isVideo'] as bool?,
      hasDialled: json['hasDialled'] as bool?,
    );

Map<String, dynamic> _$CallModelToJson(CallModel instance) => <String, dynamic>{
      'callerId': instance.callerId,
      'callerName': instance.callerName,
      'callerPic': instance.callerPic,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'receiverPic': instance.receiverPic,
      'channelId': instance.channelId,
      'isVideo': instance.isVideo,
      'hasDialled': instance.hasDialled,
    };
