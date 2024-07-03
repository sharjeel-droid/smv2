import 'package:json_annotation/json_annotation.dart';

part 'DCnewStdApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCnewStdApiResponseDomainModel{
  int success;
  String message;

  DCnewStdApiResponseDomainModel({required this.success, required this.message});

  factory DCnewStdApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCnewStdApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewStdApiResponseDomainModelToJson(this);
}

