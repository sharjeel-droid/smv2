import 'package:json_annotation/json_annotation.dart';

part 'DCVanDetApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCVanDetApiResponseNetworkEntity{
  int success;
  String message;
  DcVanDataNetworkEntity? data;

  DCVanDetApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory DCVanDetApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCVanDetApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCVanDetApiResponseNetworkEntityToJson(this);
}


@JsonSerializable()
class DcVanDataNetworkEntity{
  // int num_of_records;
  List<VehiclesNetworkEntity>? vehicles;

  DcVanDataNetworkEntity({this.vehicles});

  factory DcVanDataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcVanDataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcVanDataNetworkEntityToJson(this);
}

@JsonSerializable()
class VehiclesNetworkEntity{
  int vehicle_id;
  int admin_id;
  int? school_id;
  int? driver_id;
  String vehicle_type;
  String? reg_number;
  int is_active;
  String? date_create;
  String? date_update;
  String? school_name;
  DriverNetworkEntity? driver;
  RouteNetworkEntity? route;

  VehiclesNetworkEntity({
    required this.vehicle_id,
    required this.admin_id,
    this.school_id,
    this.driver_id,
    required this.vehicle_type,
    this.reg_number,
    required this.is_active,
    this.date_create,
    this.date_update,
    this.school_name,
    this.driver,
    this.route,
  });

  factory VehiclesNetworkEntity.fromJson(Map<String, dynamic> json) => _$VehiclesNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$VehiclesNetworkEntityToJson(this);
}


@JsonSerializable()
class DriverNetworkEntity{
  int user_id;
  int admin_id;
  int school_id;
  int vehicle_id;
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
  AccessAuthNetworkEntity? access_auth;

  DriverNetworkEntity({
    required this.user_id,
    required this.admin_id,
    required this.school_id,
    required this.vehicle_id,
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
    this.access_auth,
  });

  factory DriverNetworkEntity.fromJson(Map<String, dynamic> json) => _$DriverNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DriverNetworkEntityToJson(this);
}
@JsonSerializable()
class AccessAuthNetworkEntity{
  int access_id;
  int label_id;
  int user_id;
  String login_id;
  String pass;
  int is_active;
  String? date_create;
  String? date_update;
  int is_loggedin;
  String? token_id;

  AccessAuthNetworkEntity({
    required this.access_id,
    required this.label_id,
    required this.user_id,
    required this.login_id,
    required this.pass,
    required this.is_active,
    this.date_create,
    this.date_update,
    required this.is_loggedin,
    this.token_id,
  });

  factory AccessAuthNetworkEntity.fromJson(Map<String, dynamic> json) => _$AccessAuthNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AccessAuthNetworkEntityToJson(this);
}

@JsonSerializable()
class RouteNetworkEntity{
  int route_id;
  String? route_title;
  int vehicle_id;
  int driver_id;
  int school_id;
  String? time_start_approx;
  String? time_end_approx;
  int is_active;
  String? date_create;
  String? date_update;
  List<RouteDetailsNetworkEntity>? route_details;

  RouteNetworkEntity({
    required this.route_id,
    this.route_title,
    required this.vehicle_id,
    required this.driver_id,
    required this.school_id,
    this.time_start_approx,
    this.time_end_approx,
    required this.is_active,
    this.date_create,
    this.date_update,
  });

  factory RouteNetworkEntity.fromJson(Map<String, dynamic> json) => _$RouteNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RouteNetworkEntityToJson(this);
}
@JsonSerializable()
class RouteDetailsNetworkEntity{
  int route_detail_id;
  int route_id;
  int student_id;
  int? sorting_index;
  String? date_create;
  String? date_update;

  RouteDetailsNetworkEntity({
    required this.route_detail_id,
    required this.route_id,
    required this.student_id,
    this.sorting_index,
    this.date_create,
    this.date_update,
  });

  factory RouteDetailsNetworkEntity.fromJson(Map<String, dynamic> json) => _$RouteDetailsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RouteDetailsNetworkEntityToJson(this);
}