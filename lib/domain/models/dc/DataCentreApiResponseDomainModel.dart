import 'package:json_annotation/json_annotation.dart';

part 'DataCentreApiResponseDomainModel.g.dart';

@JsonSerializable()
class DataCentreApiResponseDomainModel{
  int success;
  String message;
  List<DataSchoolsDomainModel>? data;

  DataCentreApiResponseDomainModel({required this.success, required this.message, this.data});

  factory DataCentreApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DataCentreApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataCentreApiResponseDomainModelToJson(this);
}


@JsonSerializable()
class DataSchoolsDomainModel{
  int num_of_records;

  DataSchoolsDomainModel({required this.num_of_records});

  factory DataSchoolsDomainModel.fromJson(Map<String, dynamic> json) => _$DataSchoolsDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataSchoolsDomainModelToJson(this);
}