// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCnewStdApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCnewStdApiResponseDomainModel _$DCnewStdApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCnewStdApiResponseDomainModel(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DCnewStdApiResponseDomainModelToJson(
        DCnewStdApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
