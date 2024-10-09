// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MTripDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MTripDomainModel _$MTripDomainModelFromJson(Map<String, dynamic> json) =>
    MTripDomainModel(
      trip_id: (json['trip_id'] as num).toInt(),
      trip_course: json['trip_course'] as String,
      time_start: json['time_start'] as String,
      time_end: json['time_end'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$MTripDomainModelToJson(MTripDomainModel instance) =>
    <String, dynamic>{
      'trip_id': instance.trip_id,
      'trip_course': instance.trip_course,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'status': instance.status,
    };
