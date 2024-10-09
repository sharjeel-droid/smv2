// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewStdApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewStdApiResponseNetworkEntity _$DCnewStdApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DCnewStdApiResponseNetworkEntity(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DCnewStdApiResponseNetworkEntityToJson(
        DCnewStdApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
