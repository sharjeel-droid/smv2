// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCDriverDashApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCDriverDashApiResponseNetworkEntity
    _$DCDriverDashApiResponseNetworkEntityFromJson(Map<String, dynamic> json) =>
        DCDriverDashApiResponseNetworkEntity(
          success: json['success'] as int,
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : DcDriverDashDataNetworkEntity.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DCDriverDashApiResponseNetworkEntityToJson(
        DCDriverDashApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcDriverDashDataNetworkEntity _$DcDriverDashDataNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataNetworkEntity(
      school: json['school'] == null
          ? null
          : DcDriverDashDataSchoolNetworkEntity.fromJson(
              json['school'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : DcDriverDashDataVehicleNetworkEntity.fromJson(
              json['vehicle'] as Map<String, dynamic>),
      route: json['route'] == null
          ? null
          : DcDriverDashDataRouteNetworkEntity.fromJson(
              json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DcDriverDashDataNetworkEntityToJson(
        DcDriverDashDataNetworkEntity instance) =>
    <String, dynamic>{
      'school': instance.school,
      'vehicle': instance.vehicle,
      'route': instance.route,
    };

DcDriverDashDataSchoolNetworkEntity
    _$DcDriverDashDataSchoolNetworkEntityFromJson(Map<String, dynamic> json) =>
        DcDriverDashDataSchoolNetworkEntity(
          verification_code: json['verification_code'] as int?,
          school_name: json['school_name'] as String?,
          address: json['address'] as String?,
          contact_1: json['contact_1'] as String?,
          pic: json['pic'] as String?,
        );

Map<String, dynamic> _$DcDriverDashDataSchoolNetworkEntityToJson(
        DcDriverDashDataSchoolNetworkEntity instance) =>
    <String, dynamic>{
      'verification_code': instance.verification_code,
      'school_name': instance.school_name,
      'address': instance.address,
      'contact_1': instance.contact_1,
      'pic': instance.pic,
    };

DcDriverDashDataVehicleNetworkEntity
    _$DcDriverDashDataVehicleNetworkEntityFromJson(Map<String, dynamic> json) =>
        DcDriverDashDataVehicleNetworkEntity(
          vehicle_type: json['vehicle_type'] as String?,
          reg_number: json['reg_number'] as String?,
        );

Map<String, dynamic> _$DcDriverDashDataVehicleNetworkEntityToJson(
        DcDriverDashDataVehicleNetworkEntity instance) =>
    <String, dynamic>{
      'vehicle_type': instance.vehicle_type,
      'reg_number': instance.reg_number,
    };

DcDriverDashDataRouteNetworkEntity _$DcDriverDashDataRouteNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataRouteNetworkEntity(
      route_id: json['route_id'] as int,
      route_title: json['route_title'] as String?,
      time_start_approx: json['time_start_approx'] as String?,
      time_end_approx: json['time_end_approx'] as String?,
    );

Map<String, dynamic> _$DcDriverDashDataRouteNetworkEntityToJson(
        DcDriverDashDataRouteNetworkEntity instance) =>
    <String, dynamic>{
      'route_id': instance.route_id,
      'route_title': instance.route_title,
      'time_start_approx': instance.time_start_approx,
      'time_end_approx': instance.time_end_approx,
    };
