import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DCNewVanApiRequestDomainModel.g.dart';

@JsonSerializable()
class DCNewVanApiRequestDomainModel{
  int adminId;
  int schoolId;
  String vehicleRegNum;
  String vehicleType;
  String driverName;
  String driverNIC;
  String driverContact;
  String students;

  DCNewVanApiRequestDomainModel({
    required this.adminId,
    required this.schoolId,
    required this.vehicleRegNum,
    required this.vehicleType,
    required this.driverName,
    required this.driverNIC,
    required this.driverContact,
    required this.students
  });

  factory DCNewVanApiRequestDomainModel.fromJson(Map<String, dynamic> json) => _$DCNewVanApiRequestDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCNewVanApiRequestDomainModelToJson(this);
}
