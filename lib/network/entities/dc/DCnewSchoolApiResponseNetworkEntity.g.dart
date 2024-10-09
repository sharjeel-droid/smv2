// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewSchoolApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewSchoolApiResponseNetworkEntity
    _$DCnewSchoolApiResponseNetworkEntityFromJson(Map<String, dynamic> json) =>
        DCnewSchoolApiResponseNetworkEntity(
          success: (json['success'] as num).toInt(),
          message: json['message'] as String,
        );

Map<String, dynamic> _$DCnewSchoolApiResponseNetworkEntityToJson(
        DCnewSchoolApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
