// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCVanDetApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCVanDetApiResponseDomainModel _$DCVanDetApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCVanDetApiResponseDomainModel(
      success: json['success'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcVanDataDomainModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DCVanDetApiResponseDomainModelToJson(
        DCVanDetApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcVanDataDomainModel _$DcVanDataDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcVanDataDomainModel(
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => VehiclesDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DcVanDataDomainModelToJson(
        DcVanDataDomainModel instance) =>
    <String, dynamic>{
      'vehicles': instance.vehicles,
    };

VehiclesDomainModel _$VehiclesDomainModelFromJson(Map<String, dynamic> json) =>
    VehiclesDomainModel(
      vehicle_id: json['vehicle_id'] as int,
      admin_id: json['admin_id'] as int,
      school_id: json['school_id'] as int?,
      driver_id: json['driver_id'] as int?,
      vehicle_type: json['vehicle_type'] as String,
      reg_number: json['reg_number'] as String?,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
      school_name: json['school_name'] as String?,
      driver: json['driver'] == null
          ? null
          : DriverDomainModel.fromJson(json['driver'] as Map<String, dynamic>),
      route: json['route'] == null
          ? null
          : RouteDomainModel.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehiclesDomainModelToJson(
        VehiclesDomainModel instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicle_id,
      'admin_id': instance.admin_id,
      'school_id': instance.school_id,
      'driver_id': instance.driver_id,
      'vehicle_type': instance.vehicle_type,
      'reg_number': instance.reg_number,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'school_name': instance.school_name,
      'driver': instance.driver,
      'route': instance.route,
    };

DriverDomainModel _$DriverDomainModelFromJson(Map<String, dynamic> json) =>
    DriverDomainModel(
      user_id: json['user_id'] as int,
      admin_id: json['admin_id'] as int,
      school_id: json['school_id'] as int,
      vehicle_id: json['vehicle_id'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String,
      nic_number: json['nic_number'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      contact_1: json['contact_1'] as String?,
      contact_2: json['contact_2'] as String?,
      pic: json['pic'] as String?,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
      access_auth: json['access_auth'] == null
          ? null
          : AccessAuthDomainModel.fromJson(
              json['access_auth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverDomainModelToJson(DriverDomainModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'admin_id': instance.admin_id,
      'school_id': instance.school_id,
      'vehicle_id': instance.vehicle_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'nic_number': instance.nic_number,
      'email': instance.email,
      'address': instance.address,
      'contact_1': instance.contact_1,
      'contact_2': instance.contact_2,
      'pic': instance.pic,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'access_auth': instance.access_auth,
    };

AccessAuthDomainModel _$AccessAuthDomainModelFromJson(
        Map<String, dynamic> json) =>
    AccessAuthDomainModel(
      access_id: json['access_id'] as int,
      label_id: json['label_id'] as int,
      user_id: json['user_id'] as int,
      login_id: json['login_id'] as String,
      pass: json['pass'] as String,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
      is_loggedin: json['is_loggedin'] as int,
      token_id: json['token_id'] as String?,
    );

Map<String, dynamic> _$AccessAuthDomainModelToJson(
        AccessAuthDomainModel instance) =>
    <String, dynamic>{
      'access_id': instance.access_id,
      'label_id': instance.label_id,
      'user_id': instance.user_id,
      'login_id': instance.login_id,
      'pass': instance.pass,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'is_loggedin': instance.is_loggedin,
      'token_id': instance.token_id,
    };

RouteDomainModel _$RouteDomainModelFromJson(Map<String, dynamic> json) =>
    RouteDomainModel(
      route_id: json['route_id'] as int,
      route_title: json['route_title'] as String?,
      vehicle_id: json['vehicle_id'] as int,
      driver_id: json['driver_id'] as int,
      school_id: json['school_id'] as int,
      time_start_approx: json['time_start_approx'] as String?,
      time_end_approx: json['time_end_approx'] as String?,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
    )..route_details = (json['route_details'] as List<dynamic>?)
        ?.map(
            (e) => RouteDetailsDomainModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$RouteDomainModelToJson(RouteDomainModel instance) =>
    <String, dynamic>{
      'route_id': instance.route_id,
      'route_title': instance.route_title,
      'vehicle_id': instance.vehicle_id,
      'driver_id': instance.driver_id,
      'school_id': instance.school_id,
      'time_start_approx': instance.time_start_approx,
      'time_end_approx': instance.time_end_approx,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'route_details': instance.route_details,
    };

RouteDetailsDomainModel _$RouteDetailsDomainModelFromJson(
        Map<String, dynamic> json) =>
    RouteDetailsDomainModel(
      route_detail_id: json['route_detail_id'] as int,
      route_id: json['route_id'] as int,
      student_id: json['student_id'] as int,
      sorting_index: json['sorting_index'] as int?,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
    );

Map<String, dynamic> _$RouteDetailsDomainModelToJson(
        RouteDetailsDomainModel instance) =>
    <String, dynamic>{
      'route_detail_id': instance.route_detail_id,
      'route_id': instance.route_id,
      'student_id': instance.student_id,
      'sorting_index': instance.sorting_index,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
    };
