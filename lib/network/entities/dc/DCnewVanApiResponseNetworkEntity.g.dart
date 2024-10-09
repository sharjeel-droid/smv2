// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewVanApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewVanApiResponseNetworkEntity _$DCnewVanApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DCnewVanApiResponseNetworkEntity(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DCnewVanApiResponseNetworkEntityToJson(
        DCnewVanApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
