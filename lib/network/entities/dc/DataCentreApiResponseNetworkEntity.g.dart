// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataCentreApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCentreApiResponseNetworkEntity _$DataCentreApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DataCentreApiResponseNetworkEntity(
      success: json['success'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataSchoolsNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataCentreApiResponseNetworkEntityToJson(
        DataCentreApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DataSchoolsNetworkEntity _$DataSchoolsNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DataSchoolsNetworkEntity(
      num_of_records: json['num_of_records'] as int,
    );

Map<String, dynamic> _$DataSchoolsNetworkEntityToJson(
        DataSchoolsNetworkEntity instance) =>
    <String, dynamic>{
      'num_of_records': instance.num_of_records,
    };
