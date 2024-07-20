// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseDomainModel _$ApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    ApiResponseDomainModel(
      success: json['success'] as int,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApiResponseDomainModelToJson(
        ApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
