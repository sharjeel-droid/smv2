import 'package:json_annotation/json_annotation.dart';

part 'DCDriverActiveTripsDataDomainModel.g.dart';

@JsonSerializable()
class DcDriverActiveTripsDataDomainModel{
  // int num_of_records;
  DcDriverActiveTripsDataTripDomainModel? trip;

  DcDriverActiveTripsDataDomainModel({this.trip});

  factory DcDriverActiveTripsDataDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverActiveTripsDataTripDomainModel{
  int? trip_id;
  int? route_id;
  String? route_title;
  String? time_start;
  String? time_end;
  String? status;
  String? route_direction_string;
  String? date_create;
  String? date_update;
  int count_total = 0;
  int count_picked = 0;
  int count_absent = 0;
  int count_remaining = 0;
  List<DcDriverActiveTripsDataTripStudentsDomainModel>? students;

  DcDriverActiveTripsDataTripDomainModel({this.trip_id, this.route_id, this.route_title, this.time_start, this.time_end, this.status,
    this.route_direction_string, this.date_create, this.date_update});

  factory DcDriverActiveTripsDataTripDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataTripDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataTripDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverActiveTripsDataTripStudentsDomainModel{
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

  DcDriverActiveTripsDataTripStudentsDomainModel({this.trip_detail_id, this.student_id, this.status, this.time_pickup,
  this.reason, this.first_name, this.last_name, this.longitude, this.latitude, this.date_create, this.date_update});

  factory DcDriverActiveTripsDataTripStudentsDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverActiveTripsDataTripStudentsDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverActiveTripsDataTripStudentsDomainModelToJson(this);
}
