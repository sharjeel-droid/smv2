import 'package:json_annotation/json_annotation.dart';

part 'DCDriverDashApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCDriverDashApiResponseNetworkEntity{
  int success;
  String message;
  DcDriverDashDataNetworkEntity? data;

  DCDriverDashApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory DCDriverDashApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCDriverDashApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCDriverDashApiResponseNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverDashDataNetworkEntity{
  // int num_of_records;
  DcDriverDashDataSchoolNetworkEntity? school;
  DcDriverDashDataVehicleNetworkEntity? vehicle;
  DcDriverDashDataRouteNetworkEntity? route;
  DcDriverDashDataTripNetworkEntity? trips;

  DcDriverDashDataNetworkEntity({this.school, this.vehicle, this.route, this.trips});

  factory DcDriverDashDataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverDashDataSchoolNetworkEntity{
  // int num_of_records;
  int? verification_code;
  String? school_name;
  String? address;
  String? contact_1;
  String? pic;

  DcDriverDashDataSchoolNetworkEntity({this.verification_code, this.school_name, this.address, this.contact_1, this.pic});

  factory DcDriverDashDataSchoolNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataSchoolNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataSchoolNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverDashDataVehicleNetworkEntity{
  // int num_of_records;
  String? vehicle_type;
  String? reg_number;

  DcDriverDashDataVehicleNetworkEntity({this.vehicle_type, this.reg_number});

  factory DcDriverDashDataVehicleNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataVehicleNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataVehicleNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverDashDataRouteNetworkEntity{
  // int num_of_records;
  int route_id;
  String? route_title;
  String? time_start_approx;
  String? time_end_approx;

  DcDriverDashDataRouteNetworkEntity({required this.route_id, this.route_title, this.time_start_approx, this.time_end_approx});

  factory DcDriverDashDataRouteNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataRouteNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataRouteNetworkEntityToJson(this);
}

@JsonSerializable()
class DcDriverDashDataTripNetworkEntity{
  List<DcDriverDashDataTripDetsNetworkEntity>? today;
  List<DcDriverDashDataTripDetsNetworkEntity>? active;

  DcDriverDashDataTripNetworkEntity({required this.today, this.active});

  factory DcDriverDashDataTripNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataTripNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataTripNetworkEntityToJson(this);
}




@JsonSerializable()
class DcDriverDashDataTripDetsNetworkEntity{
  // int num_of_records;
  int trip_id;
  String? trip_course;
  String? time_start;
  String? time_end;
  String? status;

  DcDriverDashDataTripDetsNetworkEntity({required this.trip_id, this.trip_course, this.time_start, this.time_end, this.status});

  factory DcDriverDashDataTripDetsNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataTripDetsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataTripDetsNetworkEntityToJson(this);
}