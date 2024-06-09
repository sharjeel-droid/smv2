// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCDriverDashApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCDriverDashApiResponseDomainModel _$DCDriverDashApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCDriverDashApiResponseDomainModel(
      success: json['success'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcDriverDashDataDomainModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DCDriverDashApiResponseDomainModelToJson(
        DCDriverDashApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcDriverDashDataDomainModel _$DcDriverDashDataDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataDomainModel(
      school: json['school'] == null
          ? null
          : DcDriverDashDataSchoolDomainModel.fromJson(
              json['school'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : DcDriverDashDataVehicleDomainModel.fromJson(
              json['vehicle'] as Map<String, dynamic>),
      route: json['route'] == null
          ? null
          : DcDriverDashDataRouteDomainModel.fromJson(
              json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DcDriverDashDataDomainModelToJson(
        DcDriverDashDataDomainModel instance) =>
    <String, dynamic>{
      'school': instance.school,
      'vehicle': instance.vehicle,
      'route': instance.route,
    };

DcDriverDashDataSchoolDomainModel _$DcDriverDashDataSchoolDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataSchoolDomainModel(
      verification_code: json['verification_code'] as int?,
      school_name: json['school_name'] as String?,
      address: json['address'] as String?,
      contact_1: json['contact_1'] as String?,
      pic: json['pic'] as String?,
    );

Map<String, dynamic> _$DcDriverDashDataSchoolDomainModelToJson(
        DcDriverDashDataSchoolDomainModel instance) =>
    <String, dynamic>{
      'verification_code': instance.verification_code,
      'school_name': instance.school_name,
      'address': instance.address,
      'contact_1': instance.contact_1,
      'pic': instance.pic,
    };

DcDriverDashDataVehicleDomainModel _$DcDriverDashDataVehicleDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataVehicleDomainModel(
      vehicle_type: json['vehicle_type'] as String?,
      reg_number: json['reg_number'] as String?,
    );

Map<String, dynamic> _$DcDriverDashDataVehicleDomainModelToJson(
        DcDriverDashDataVehicleDomainModel instance) =>
    <String, dynamic>{
      'vehicle_type': instance.vehicle_type,
      'reg_number': instance.reg_number,
    };

DcDriverDashDataRouteDomainModel _$DcDriverDashDataRouteDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcDriverDashDataRouteDomainModel(
      route_id: json['route_id'] as int,
      route_title: json['route_title'] as String?,
      time_start_approx: json['time_start_approx'] as String?,
      time_end_approx: json['time_end_approx'] as String?,
    );

Map<String, dynamic> _$DcDriverDashDataRouteDomainModelToJson(
        DcDriverDashDataRouteDomainModel instance) =>
    <String, dynamic>{
      'route_id': instance.route_id,
      'route_title': instance.route_title,
      'time_start_approx': instance.time_start_approx,
      'time_end_approx': instance.time_end_approx,
    };
