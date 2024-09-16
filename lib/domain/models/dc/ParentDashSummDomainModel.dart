import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/MSchoolDomainModel.dart';
import 'package:SMV2/domain/models/dc/MTripDomainModel.dart';
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
  MSchoolDomainModel? school;
  ParentDashSummTripDomainModel? trips;

  ParentDashSummDataDomainModel({this.school, this.trips});

  factory ParentDashSummDataDomainModel.fromJson(Map<String, dynamic> json) => _$ParentDashSummDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDashSummDataDomainModelToJson(this);
}

@JsonSerializable()
class ParentDashSummTripDomainModel{
  List<MTripDomainModel>? today;
  List<MTripDomainModel>? active;

  ParentDashSummTripDomainModel({this.today, this.active});

  factory ParentDashSummTripDomainModel.fromJson(Map<String, dynamic> json) => _$ParentDashSummTripDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDashSummTripDomainModelToJson(this);
}