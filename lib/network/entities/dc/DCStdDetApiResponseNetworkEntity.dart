import 'package:json_annotation/json_annotation.dart';

part 'DCStdDetApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCStdDetApiResponseNetworkEntity{
  int success;
  String message;
  DcStudentsDataNetworkEntity? data;

  DCStdDetApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory DCStdDetApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCStdDetApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCStdDetApiResponseNetworkEntityToJson(this);
}


@JsonSerializable()
class DcStudentsDataNetworkEntity{
  // int num_of_records;
  List<StudentsNetworkEntity>? students;

  DcStudentsDataNetworkEntity({this.students});

  factory DcStudentsDataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcStudentsDataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcStudentsDataNetworkEntityToJson(this);
}

@JsonSerializable()
class StudentsNetworkEntity{
  int student_id;
  int admin_id;
  int school_id;
  int father_id;
  int? mother_id;
  String first_name;
  String? last_name;
  String gender;
  String? pic;
  int is_active;
  String? date_create;
  String? date_update;
  String? school_name;
  List<ParentsNetworkEntity>? parents;

  StudentsNetworkEntity({
    required this.student_id,
    required this.admin_id,
    required this.school_id,
    required this.father_id,
    this.mother_id,
    required this.first_name,
    this.last_name,
    required this.gender,
    this.pic,
    required this.is_active,
    this.date_create,
    this.date_update,
    this.school_name,
     this.parents,
  });

  factory StudentsNetworkEntity.fromJson(Map<String, dynamic> json) => _$StudentsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$StudentsNetworkEntityToJson(this);
}


@JsonSerializable()
class ParentsNetworkEntity{
  int user_id;
  int admin_id;
  int school_id;
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
  String? date_create;
  String? date_update;

  ParentsNetworkEntity({
    required this.user_id,
    required this.admin_id,
    required this.school_id,
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
    this.date_create,
    this.date_update,
  });

  factory ParentsNetworkEntity.fromJson(Map<String, dynamic> json) => _$ParentsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ParentsNetworkEntityToJson(this);
}