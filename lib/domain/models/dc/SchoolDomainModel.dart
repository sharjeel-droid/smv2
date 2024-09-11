import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SchoolDomainModel.g.dart';

@JsonSerializable()
class SchoolDomainModel{
  int verification_code;
  String school_name;
  String address;
  String contact_1;
  String? pic;

  SchoolDomainModel({
    required this.verification_code, required this.school_name, required this.address, required this.contact_1,
    this.pic
  });

  factory SchoolDomainModel.fromJson(Map<String, dynamic> json) => _$SchoolDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolDomainModelToJson(this);
}
