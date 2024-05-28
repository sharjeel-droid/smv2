import 'package:json_annotation/json_annotation.dart';

part 'DCnewStdApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class DCnewStdApiResponseNetworkEntity{
  int success;
  String message;

  DCnewStdApiResponseNetworkEntity({required this.success, required this.message});

  factory DCnewStdApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$DCnewStdApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewStdApiResponseNetworkEntityToJson(this);
}

