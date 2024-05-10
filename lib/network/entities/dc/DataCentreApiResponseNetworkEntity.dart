import 'package:json_annotation/json_annotation.dart';

part 'DataCentreApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DataCentreApiResponseNetworkEntity{
  int success;
  String message;
  List<DataSchoolsNetworkEntity>? data;

  DataCentreApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory DataCentreApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DataCentreApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DataCentreApiResponseNetworkEntityToJson(this);
}


@JsonSerializable()
class DataSchoolsNetworkEntity{
  int num_of_records;

  DataSchoolsNetworkEntity({required this.num_of_records});

  factory DataSchoolsNetworkEntity.fromJson(Map<String, dynamic> json) => _$DataSchoolsNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DataSchoolsNetworkEntityToJson(this);
}
