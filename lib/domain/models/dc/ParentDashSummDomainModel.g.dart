// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParentDashSummDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentDashSummDomainModel _$ParentDashSummDomainModelFromJson(
        Map<String, dynamic> json) =>
    ParentDashSummDomainModel(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ParentDashSummDataDomainModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParentDashSummDomainModelToJson(
        ParentDashSummDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ParentDashSummDataDomainModel _$ParentDashSummDataDomainModelFromJson(
        Map<String, dynamic> json) =>
    ParentDashSummDataDomainModel(
      school: json['school'] == null
          ? null
          : MSchoolDomainModel.fromJson(json['school'] as Map<String, dynamic>),
      trips: json['trips'] == null
          ? null
          : ParentDashSummTripDomainModel.fromJson(
              json['trips'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParentDashSummDataDomainModelToJson(
        ParentDashSummDataDomainModel instance) =>
    <String, dynamic>{
      'school': instance.school,
      'trips': instance.trips,
    };

ParentDashSummTripDomainModel _$ParentDashSummTripDomainModelFromJson(
        Map<String, dynamic> json) =>
    ParentDashSummTripDomainModel(
      today: (json['today'] as List<dynamic>?)
          ?.map((e) => MTripDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: (json['active'] as List<dynamic>?)
          ?.map((e) => MTripDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParentDashSummTripDomainModelToJson(
        ParentDashSummTripDomainModel instance) =>
    <String, dynamic>{
      'today': instance.today,
      'active': instance.active,
    };
