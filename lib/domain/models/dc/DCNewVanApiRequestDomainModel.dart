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
  List<DCNewVanApiStdRequestDomainModel> students;

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


@JsonSerializable()
class DCNewVanApiStdRequestDomainModel{
  int studentId;
  int sortingIndex;

  DCNewVanApiStdRequestDomainModel({
    required this.studentId,
    required this.sortingIndex
  });

  factory DCNewVanApiStdRequestDomainModel.fromJson(Map<String, dynamic> json) => _$DCNewVanApiStdRequestDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCNewVanApiStdRequestDomainModelToJson(this);
}