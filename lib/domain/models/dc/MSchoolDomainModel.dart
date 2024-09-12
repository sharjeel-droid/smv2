import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MSchoolDomainModel.g.dart';

@JsonSerializable()
class MSchoolDomainModel{
  int verification_code;
  String school_name;
  String address;
  String contact_1;
  String? pic;

  MSchoolDomainModel({
    required this.verification_code, required this.school_name, required this.address, required this.contact_1,
    this.pic
  });

  factory MSchoolDomainModel.fromJson(Map<String, dynamic> json) => _$MSchoolDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$MSchoolDomainModelToJson(this);
}
