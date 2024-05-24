import 'package:json_annotation/json_annotation.dart';

part 'DCnewSchoolApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCnewSchoolApiResponseDomainModel{
  int success;
  String message;

  DCnewSchoolApiResponseDomainModel({required this.success, required this.message});

  factory DCnewSchoolApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCnewSchoolApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCnewSchoolApiResponseDomainModelToJson(this);
}

