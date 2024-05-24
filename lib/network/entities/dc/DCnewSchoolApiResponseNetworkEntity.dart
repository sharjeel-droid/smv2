import 'package:json_annotation/json_annotation.dart';

part 'DCnewSchoolApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCnewSchoolApiResponseNetworkEntity{
  int success;
  String message;

  DCnewSchoolApiResponseNetworkEntity({required this.success, required this.message});

  factory DCnewSchoolApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCnewSchoolApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewSchoolApiResponseNetworkEntityToJson(this);
}

