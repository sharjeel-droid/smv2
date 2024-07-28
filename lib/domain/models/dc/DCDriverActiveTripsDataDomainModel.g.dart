// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCDriverActiveTripsDataDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DcDriverActiveTripsDataDomainModel _$DcDriverActiveTripsDataDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcDriverActiveTripsDataDomainModel(
      trip: json['trip'] == null
          ? null
          : DcDriverActiveTripsDataTripDomainModel.fromJson(
              json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DcDriverActiveTripsDataDomainModelToJson(
        DcDriverActiveTripsDataDomainModel instance) =>
    <String, dynamic>{
      'trip': instance.trip,
    };

DcDriverActiveTripsDataTripDomainModel
    _$DcDriverActiveTripsDataTripDomainModelFromJson(
            Map<String, dynamic> json) =>
        DcDriverActiveTripsDataTripDomainModel(
          trip_id: json['trip_id'] as int?,
          route_id: json['route_id'] as int?,
          route_title: json['route_title'] as String?,
          time_start: json['time_start'] as String?,
          time_end: json['time_end'] as String?,
          status: json['status'] as String?,
          route_direction_string: json['route_direction_string'] as String?,
          date_create: json['date_create'] as String?,
          date_update: json['date_update'] as String?,
        )..students = (json['students'] as List<dynamic>?)
            ?.map((e) =>
                DcDriverActiveTripsDataTripStudentsDomainModel.fromJson(
                    e as Map<String, dynamic>))
            .toList();

Map<String, dynamic> _$DcDriverActiveTripsDataTripDomainModelToJson(
        DcDriverActiveTripsDataTripDomainModel instance) =>
    <String, dynamic>{
      'trip_id': instance.trip_id,
      'route_id': instance.route_id,
      'route_title': instance.route_title,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'status': instance.status,
      'route_direction_string': instance.route_direction_string,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'students': instance.students,
    };

DcDriverActiveTripsDataTripStudentsDomainModel
    _$DcDriverActiveTripsDataTripStudentsDomainModelFromJson(
            Map<String, dynamic> json) =>
        DcDriverActiveTripsDataTripStudentsDomainModel(
          trip_detail_id: json['trip_detail_id'] as int?,
          student_id: json['student_id'] as int?,
          status: json['status'] as String?,
          time_pickup: json['time_pickup'] as String?,
          reason: json['reason'] as String?,
          first_name: json['first_name'] as String?,
          last_name: json['last_name'] as String?,
          longitude: json['longitude'] as String?,
          latitude: json['latitude'] as String?,
          date_create: json['date_create'] as String?,
          date_update: json['date_update'] as String?,
        );

Map<String, dynamic> _$DcDriverActiveTripsDataTripStudentsDomainModelToJson(
        DcDriverActiveTripsDataTripStudentsDomainModel instance) =>
    <String, dynamic>{
      'trip_detail_id': instance.trip_detail_id,
      'student_id': instance.student_id,
      'status': instance.status,
      'time_pickup': instance.time_pickup,
      'reason': instance.reason,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
    };
