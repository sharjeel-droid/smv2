import 'package:json_annotation/json_annotation.dart';

part 'DCnewVanApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCnewVanApiResponseNetworkEntity{
  int success;
  String message;

  DCnewVanApiResponseNetworkEntity({required this.success, required this.message});

  factory DCnewVanApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCnewVanApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewVanApiResponseNetworkEntityToJson(this);
}

