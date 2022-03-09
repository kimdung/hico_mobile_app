import 'package:json_annotation/json_annotation.dart';
part 'documents_certificate_model.g.dart';

@JsonSerializable()
class DocumentsCertificateModel {
  int? id;
  String? url;
  String? alt;
  String? title;
  String? extension;
  int? size;

  DocumentsCertificateModel(
      {this.id, this.url, this.alt, this.title, this.extension, this.size});

  factory DocumentsCertificateModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentsCertificateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsCertificateModelToJson(this);
}
