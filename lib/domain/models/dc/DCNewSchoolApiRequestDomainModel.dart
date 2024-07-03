import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DCNewSchoolApiRequestDomainModel.g.dart';

@JsonSerializable()
class DCNewSchoolApiRequestDomainModel{
  int adminId;
  String schoolName;
  String schoolAddress;
  String schoolContact;
  String supervisorName;
  String supervisorNIC;
  String supervisorEmail;
  String supervisorAddress;
  String supervisorContact;

  DCNewSchoolApiRequestDomainModel({
    required this.adminId,
    required this.schoolName,
    required this.schoolAddress,
    required this.schoolContact,
    required this.supervisorName,
    required this.supervisorNIC,
    required this.supervisorEmail,
    required this.supervisorAddress,
    required this.supervisorContact,
  });

  factory DCNewSchoolApiRequestDomainModel.fromJson(Map<String, dynamic> json) => _$DCNewSchoolApiRequestDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCNewSchoolApiRequestDomainModelToJson(this);
}
