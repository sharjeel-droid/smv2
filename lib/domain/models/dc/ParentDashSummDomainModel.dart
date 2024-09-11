import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/TripDomainModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ParentDashSummDomainModel.g.dart';

@JsonSerializable()
class ParentDashSummDomainModel{
  int success;
  String message;
  ParentDashSummDataDomainModel? data;

  ParentDashSummDomainModel({required this.success, required this.message, this.data});

  factory ParentDashSummDomainModel.fromJson(Map<String, dynamic> json) => _$ParentDashSummDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDashSummDomainModelToJson(this);
}


@JsonSerializable()
class ParentDashSummDataDomainModel{
  SchoolDomainModel? school;
  ParentDashSummTripDomainModel? trips;

  ParentDashSummDataDomainModel({this.school, this.trips});

  factory ParentDashSummDataDomainModel.fromJson(Map<String, dynamic> json) => _$ParentDashSummDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDashSummDataDomainModelToJson(this);
}

@JsonSerializable()
class ParentDashSummTripDomainModel{
  List<TripDomainModel>? today;
  List<TripDomainModel>? active;

  ParentDashSummTripDomainModel({this.today, this.active});

  factory ParentDashSummTripDomainModel.fromJson(Map<String, dynamic> json) => _$ParentDashSummTripDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDashSummTripDomainModelToJson(this);
}