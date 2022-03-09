// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentsCertificateModel _$DocumentsCertificateModelFromJson(
        Map<String, dynamic> json) =>
    DocumentsCertificateModel(
      id: json['id'] as int?,
      url: json['url'] as String?,
      alt: json['alt'] as String?,
      title: json['title'] as String?,
      extension: json['extension'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$DocumentsCertificateModelToJson(
        DocumentsCertificateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'alt': instance.alt,
      'title': instance.title,
      'extension': instance.extension,
      'size': instance.size,
    };
