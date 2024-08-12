import 'package:json_annotation/json_annotation.dart';

part 'LoginApiResponseDomainModel.g.dart';

@JsonSerializable()
class LoginApiResponseDomainModel{
  int success;
  String message;
  List<DataDomainModel>? data;

  LoginApiResponseDomainModel({required this.success, required this.message, this.data});

  factory LoginApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$LoginApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginApiResponseDomainModelToJson(this);
}

//auth_access
@JsonSerializable()
class DataDomainModel{
  int access_id;
  int label_id;
  int user_id;
  String login_id;
  String pass;
  String date_create;
  String? date_update;
  int is_active;
  int is_loggedin;
  String? token_id;
  BIODomainModel bio;

  DataDomainModel({required this.access_id,
    required this.label_id,
    required this.user_id,
    required this.login_id,
    required this.pass,
    required this.date_create,
    this.date_update,
    required this.is_active,
    required this.is_loggedin,
     this.token_id,
    required this.bio});

  factory DataDomainModel.fromJson(Map<String, dynamic> json) => _$DataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataDomainModelToJson(this);

}

//dc_user_supervisors
@JsonSerializable()
class BIODomainModel{

  int user_id;
  int? s_admin_id;
  int? admin_id;
  int? school_id;
  String first_name;
  String? last_name;
  String gender;
  String nic_number;
  String? email;
  String contact_1;
  String? contact_2;
  String address;
  String? pic;
  int is_active;
  String date_create;
  String? date_update;
  LOCUsersDomainModel? loc_users;

  BIODomainModel({required this.user_id,
     this.s_admin_id,
     this.admin_id,
    this.school_id,
    required this.first_name,
     this.last_name,
    required this.gender,
    required this.nic_number,
     this.email,
    required this.contact_1,
    this.contact_2,
    required this.address,
     this.pic,
    required this.is_active,
    required this.date_create,
    this.date_update,
    this.loc_users});

  factory BIODomainModel.fromJson(Map<String, dynamic> json) => _$BIODomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$BIODomainModelToJson(this);

}

//loc_users
@JsonSerializable()
class LOCUsersDomainModel{
  int loc_user_id;
  int user_id;
  int label_id;
  String? longitude;
  String? latitude;
  String date_create;
  String? date_update;

  LOCUsersDomainModel({required this.loc_user_id,
    required this.user_id,
    required this.label_id,
    required this.longitude,
    required this.latitude,
    required this.date_create,
    this.date_update});

  factory LOCUsersDomainModel.fromJson(Map<String, dynamic> json) => _$LOCUsersDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$LOCUsersDomainModelToJson(this);
}