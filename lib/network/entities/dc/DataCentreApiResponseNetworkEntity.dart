import 'package:json_annotation/json_annotation.dart';

part 'DataCentreApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DataCentreApiResponseNetworkEntity{
  int success;
  String message;
  DcDataNetworkEntity? data;

  DataCentreApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory DataCentreApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DataCentreApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DataCentreApiResponseNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDataNetworkEntity{
  int num_of_records;
  List<SchoolNetworkEntity>? schools;

  DcDataNetworkEntity({required this.num_of_records, this.schools});

  factory DcDataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDataNetworkEntityToJson(this);
}

@JsonSerializable()
class SchoolNetworkEntity{
  int school_id;
  int admin_id;
  int? verification_code;
  String school_name;
  String address;
  String contact_1;
  String? contact_2;
  String? pic;
  int is_active;
  String date_create;
  SupervisorNetworkEntity? supervisor;

  SchoolNetworkEntity({
    required this.school_id,
    required this.admin_id,
    this.verification_code,
    required this.school_name,
    required this.address,
    required this.contact_1,
    this.contact_2,
    this.pic,
    required this.is_active,
    required this.date_create,
     this.supervisor,
  });

  factory SchoolNetworkEntity.fromJson(Map<String, dynamic> json) => _$SchoolNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolNetworkEntityToJson(this);
}


@JsonSerializable()
class SupervisorNetworkEntity{
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

  SupervisorNetworkEntity({
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

  factory SupervisorNetworkEntity.fromJson(Map<String, dynamic> json) => _$SupervisorNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SupervisorNetworkEntityToJson(this);
}