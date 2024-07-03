import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DCNewStdApiRequestDomainModel.g.dart';

@JsonSerializable()
class DCNewStdApiRequestDomainModel{
  int adminId;
  String studentName;
  int schoolId;
  String fatherName;
  String fatherNIC;
  String fatherAddress;
  String fatherContact;

  DCNewStdApiRequestDomainModel({
    required this.adminId,
    required this.studentName,
    required this.schoolId,
    required this.fatherName,
    required this.fatherNIC,
    required this.fatherAddress,
    required this.fatherContact
  });

  factory DCNewStdApiRequestDomainModel.fromJson(Map<String, dynamic> json) => _$DCNewStdApiRequestDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCNewStdApiRequestDomainModelToJson(this);
}
