import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MTripDomainModel.g.dart';

@JsonSerializable()
class MTripDomainModel{
  int trip_id;
  String trip_course;
  String time_start;
  String? time_end;
  String status;

  MTripDomainModel({
    required this.trip_id, required this.trip_course, required this.time_start, this.time_end,
    required this.status
  });

  factory MTripDomainModel.fromJson(Map<String, dynamic> json) => _$MTripDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$MTripDomainModelToJson(this);
}
