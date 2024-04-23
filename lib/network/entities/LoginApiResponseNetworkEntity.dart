import 'package:json_annotation/json_annotation.dart';

part 'LoginApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class LoginApiResponseNetworkEntity{
  int success;
  String message;
  List<DataNetworkEntity>? data;

  LoginApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory LoginApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$LoginApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginApiResponseNetworkEntityToJson(this);
}

//auth_access
@JsonSerializable()
class DataNetworkEntity{
  String access_id;
  String label_id;
  String user_id;
  String login_id;
  String pass;
  String date_create;
  String? date_update;
  String is_active;
  String is_loggedin;
  String? token_id;
  BIONetworkEntity bio;

  DataNetworkEntity({required this.access_id,
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

  factory DataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DataNetworkEntityToJson(this);

}

//dc_user_supervisors
@JsonSerializable()
class BIONetworkEntity{

  String user_id;
  String admin_id;
  String school_id;
  String first_name;
  String last_name;
  String gender;
  String nic_number;
  String email;
  String contact_1;
  String? contact_2;
  String address;
  String pic;
  String is_active;
  String date_create;
  String? date_update;
  LOCUsersNetworkEntity? loc_users;

  BIONetworkEntity({required this.user_id,
    required this.admin_id,
    required this.school_id,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.nic_number,
    required this.email,
    required this.contact_1,
    this.contact_2,
    required this.address,
    required this.pic,
    required this.is_active,
    required this.date_create,
    this.date_update,
    this.loc_users});

  factory BIONetworkEntity.fromJson(Map<String, dynamic> json) => _$BIONetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BIONetworkEntityToJson(this);

}

//loc_users
@JsonSerializable()
class LOCUsersNetworkEntity{
  String loc_user_id;
  String user_id;
  String label_id;
  String longitude;
  String latitude;
  String date_create;
  String? date_update;

  LOCUsersNetworkEntity({required this.loc_user_id,
    required this.user_id,
    required this.label_id,
    required this.longitude,
    required this.latitude,
    required this.date_create,
    this.date_update});

  factory LOCUsersNetworkEntity.fromJson(Map<String, dynamic> json) => _$LOCUsersNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LOCUsersNetworkEntityToJson(this);
}


