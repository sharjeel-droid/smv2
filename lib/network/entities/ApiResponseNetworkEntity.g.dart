// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseNetworkEntity _$ApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    ApiResponseNetworkEntity(
      success: json['success'] as int,
      message: json['message'] as String,
      fcmResponse: json['fcmResponse'] as String?,
      lastInsertedId: json['lastInsertedId'] as int?,
      data: json['data'],
    );

Map<String, dynamic> _$ApiResponseNetworkEntityToJson(
        ApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'fcmResponse': instance.fcmResponse,
      'lastInsertedId': instance.lastInsertedId,
      'data': instance.data,
    };
