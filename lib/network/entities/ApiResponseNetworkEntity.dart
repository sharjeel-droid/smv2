import 'package:json_annotation/json_annotation.dart';

part 'ApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class ApiResponseNetworkEntity{
  int success;
  String message;
  List<dynamic>? data;

  ApiResponseNetworkEntity({required this.success, required this.message, this.data});

  factory ApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$ApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseNetworkEntityToJson(this);
}