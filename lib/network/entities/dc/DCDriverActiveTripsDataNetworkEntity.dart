import 'package:json_annotation/json_annotation.dart';

part 'DCDriverActiveTripsDataNetworkEntity.g.dart';

@JsonSerializable()
class DcDriverActiveTripsDataNetworkEntity{
  // int num_of_records;
  DcDriverActiveTripsDataTripNetworkEntity? trip;

  DcDriverActiveTripsDataNetworkEntity({this.trip});

  factory DcDriverActiveTripsDataNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverActiveTripsDataTripNetworkEntity{
  int? trip_id;
  int? route_id;
  String? time_start;
  String? time_end;
  String? status;
  String? route_direction_string;
  String? date_create;
  String? date_update;
  List<DcDriverActiveTripsDataTripStudentsNetworkEntity>? students;

  DcDriverActiveTripsDataTripNetworkEntity({this.trip_id, this.route_id, this.time_start, this.time_end, this.status,
    this.route_direction_string, this.date_create, this.date_update});

  factory DcDriverActiveTripsDataTripNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataTripNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataTripNetworkEntityToJson(this);
}


@JsonSerializable()
class DcDriverActiveTripsDataTripStudentsNetworkEntity{
  int? trip_detail_id;
  int? student_id;
  String? status;
  String? time_pickup;
  String? reason;
  String? first_name;
  String? last_name;
  String? longitude;
  String? latitude;
  String? date_create;
  String? date_update;

  DcDriverActiveTripsDataTripStudentsNetworkEntity({this.trip_detail_id, this.student_id, this.status, this.time_pickup,
  this.reason, this.first_name, this.last_name, this.longitude, this.latitude, this.date_create, this.date_update});

  factory DcDriverActiveTripsDataTripStudentsNetworkEntity.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataTripStudentsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataTripStudentsNetworkEntityToJson(this);
}
