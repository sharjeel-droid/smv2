import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DataCentreApiResponseDomainModel.g.dart';

@JsonSerializable()
class DataCentreApiResponseDomainModel{
  int success;
  String message;
  DcDataDomainModel? data;

  DataCentreApiResponseDomainModel({required this.success, required this.message, this.data});

  factory DataCentreApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DataCentreApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataCentreApiResponseDomainModelToJson(this);
}



@JsonSerializable()
class DcDataDomainModel{
  int num_of_records;
  List<SchoolDomainModel>? schools;

  DcDataDomainModel({required this.num_of_records, this.schools});

  factory DcDataDomainModel.fromJson(Map<String, dynamic> json) => _$DcDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDataDomainModelToJson(this);
}

@JsonSerializable()
class SchoolDomainModel{
  int school_id;
  int admin_id;
  int verification_code;
  String school_name;
  String address;
  String contact_1;
  String? contact_2;
  String? pic;
  int is_active;
  String date_create;
  SupervisorDomainModel? supervisor;

  SchoolDomainModel({
    required this.school_id,
    required this.admin_id,
    required this.verification_code,
    required this.school_name,
    required this.address,
    required this.contact_1,
    this.contact_2,
    this.pic,
    required this.is_active,
    required this.date_create,
    this.supervisor,
  });

  factory SchoolDomainModel.fromJson(Map<String, dynamic> json) => _$SchoolDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolDomainModelToJson(this);
}


@JsonSerializable()
class SupervisorDomainModel{
  int user_id;
  String first_name;
  String? last_name;
  String gender;
  String? nic_number;
  String? email;
  String? address;
  String? contact_1;
  String? contact_2;
  String? pic;
  int is_active;

  SupervisorDomainModel({
    required this.user_id,
    required this.first_name,
     this.last_name,
    required this.gender,
    this.nic_number,
    this.email,
    this.address,
    this.contact_1,
    this.contact_2,
    this.pic,
    required this.is_active,
  });

  factory SupervisorDomainModel.fromJson(Map<String, dynamic> json) => _$SupervisorDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$SupervisorDomainModelToJson(this);
}