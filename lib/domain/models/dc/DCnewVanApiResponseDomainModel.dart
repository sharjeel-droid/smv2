import 'package:json_annotation/json_annotation.dart';

part 'DCnewVanApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCnewVanApiResponseDomainModel{
  int success;
  String message;

  DCnewVanApiResponseDomainModel({required this.success, required this.message});

  factory DCnewVanApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCnewVanApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewVanApiResponseDomainModelToJson(this);
}

