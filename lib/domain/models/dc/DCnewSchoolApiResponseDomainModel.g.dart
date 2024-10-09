// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewSchoolApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewSchoolApiResponseDomainModel _$DCnewSchoolApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCnewSchoolApiResponseDomainModel(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DCnewSchoolApiResponseDomainModelToJson(
        DCnewSchoolApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
