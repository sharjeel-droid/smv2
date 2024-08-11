import 'package:json_annotation/json_annotation.dart';

part 'ApiResponseNetworkEntity.g.dart';

@JsonSerializable()
class ApiResponseNetworkEntity{
  int success;
  String message;
  String? fcmResponse;
  int? lastInsertedId;
  dynamic data;

  ApiResponseNetworkEntity({required this.success, required this.message, this.fcmResponse, this.lastInsertedId, this.data});

  factory ApiResponseNetworkEntity.fromJson(Map<String, dynamic> json) => _$ApiResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseNetworkEntityToJson(this);
}