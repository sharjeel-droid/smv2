// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewVanApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewVanApiResponseDomainModel _$DCnewVanApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCnewVanApiResponseDomainModel(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DCnewVanApiResponseDomainModelToJson(
        DCnewVanApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
