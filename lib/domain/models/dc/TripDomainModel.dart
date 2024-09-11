import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TripDomainModel.g.dart';

@JsonSerializable()
class TripDomainModel{
  int trip_id;
  String trip_course;
  String time_start;
  String? time_end;
  String status;

  TripDomainModel({
    required this.trip_id, required this.trip_course, required this.time_start, this.time_end,
    required this.status
  });

  factory TripDomainModel.fromJson(Map<String, dynamic> json) => _$TripDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripDomainModelToJson(this);
}
