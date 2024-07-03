import 'package:json_annotation/json_annotation.dart';

part 'DCStdDetApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCStdDetApiResponseDomainModel{
  int success;
  String message;
  DcStudentsDataDomainModel? data;

  DCStdDetApiResponseDomainModel({required this.success, required this.message, this.data});

  factory DCStdDetApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCStdDetApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCStdDetApiResponseDomainModelToJson(this);
}


@JsonSerializable()
class DcStudentsDataDomainModel{
  // int num_of_records;
  List<StudentsDomainModel>? students;

  DcStudentsDataDomainModel({this.students});

  factory DcStudentsDataDomainModel.fromJson(Map<String, dynamic> json) => _$DcStudentsDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcStudentsDataDomainModelToJson(this);
}

@JsonSerializable()
class StudentsDomainModel{
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
  List<ParentsDomainModel>? parents;

  StudentsDomainModel({
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

  factory StudentsDomainModel.fromJson(Map<String, dynamic> json) => _$StudentsDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentsDomainModelToJson(this);
}


@JsonSerializable()
class ParentsDomainModel{
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

  ParentsDomainModel({
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

  factory ParentsDomainModel.fromJson(Map<String, dynamic> json) => _$ParentsDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentsDomainModelToJson(this);
}