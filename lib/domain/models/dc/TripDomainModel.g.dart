// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDomainModel _$TripDomainModelFromJson(Map<String, dynamic> json) =>
    TripDomainModel(
      trip_id: json['trip_id'] as int,
      trip_course: json['trip_course'] as String,
      time_start: json['time_start'] as String,
      time_end: json['time_end'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TripDomainModelToJson(TripDomainModel instance) =>
    <String, dynamic>{
      'trip_id': instance.trip_id,
      'trip_course': instance.trip_course,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'status': instance.status,
    };
