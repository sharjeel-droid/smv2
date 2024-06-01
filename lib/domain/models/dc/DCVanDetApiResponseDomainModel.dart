import 'package:json_annotation/json_annotation.dart';

part 'DCVanDetApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCVanDetApiResponseDomainModel{
  int success;
  String message;
  DcVanDataDomainModel? data;

  DCVanDetApiResponseDomainModel({required this.success, required this.message, this.data});

  factory DCVanDetApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCVanDetApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCVanDetApiResponseDomainModelToJson(this);
}


@JsonSerializable()
class DcVanDataDomainModel{
  // int num_of_records;
  List<VehiclesDomainModel>? vehicles;

  DcVanDataDomainModel({this.vehicles});

  factory DcVanDataDomainModel.fromJson(Map<String, dynamic> json) => _$DcVanDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcVanDataDomainModelToJson(this);
}

@JsonSerializable()
class VehiclesDomainModel{
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
  DriverDomainModel? driver;
  RouteDomainModel? route;

  VehiclesDomainModel({
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

  factory VehiclesDomainModel.fromJson(Map<String, dynamic> json) => _$VehiclesDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehiclesDomainModelToJson(this);
}


@JsonSerializable()
class DriverDomainModel{
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
  AccessAuthDomainModel? access_auth;

  DriverDomainModel({
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

  factory DriverDomainModel.fromJson(Map<String, dynamic> json) => _$DriverDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DriverDomainModelToJson(this);
}
@JsonSerializable()
class AccessAuthDomainModel{
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

  AccessAuthDomainModel({
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

  factory AccessAuthDomainModel.fromJson(Map<String, dynamic> json) => _$AccessAuthDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccessAuthDomainModelToJson(this);
}

@JsonSerializable()
class RouteDomainModel{
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
  List<RouteDetailsDomainModel>? route_details;

  RouteDomainModel({
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

  factory RouteDomainModel.fromJson(Map<String, dynamic> json) => _$RouteDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteDomainModelToJson(this);
}
@JsonSerializable()
class RouteDetailsDomainModel{
  int route_detail_id;
  int route_id;
  int student_id;
  int? sorting_index;
  String? date_create;
  String? date_update;

  RouteDetailsDomainModel({
    required this.route_detail_id,
    required this.route_id,
    required this.student_id,
    this.sorting_index,
    this.date_create,
    this.date_update,
  });

  factory RouteDetailsDomainModel.fromJson(Map<String, dynamic> json) => _$RouteDetailsDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteDetailsDomainModelToJson(this);
}