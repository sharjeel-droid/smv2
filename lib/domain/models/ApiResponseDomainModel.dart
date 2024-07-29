import 'package:json_annotation/json_annotation.dart';

part 'ApiResponseDomainModel.g.dart';

@JsonSerializable()
class ApiResponseDomainModel{
  int success;
  String message;
  dynamic data;

  ApiResponseDomainModel({required this.success, required this.message, this.data});

  factory ApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$ApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseDomainModelToJson(this);
}