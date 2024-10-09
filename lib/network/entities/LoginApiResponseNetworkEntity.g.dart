// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginApiResponseNetworkEntity _$LoginApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    LoginApiResponseNetworkEntity(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoginApiResponseNetworkEntityToJson(
        LoginApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DataNetworkEntity _$DataNetworkEntityFromJson(Map<String, dynamic> json) =>
    DataNetworkEntity(
      access_id: (json['access_id'] as num).toInt(),
      label_id: (json['label_id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      login_id: json['login_id'] as String,
      pass: json['pass'] as String,
      date_create: json['date_create'] as String,
      date_update: json['date_update'] as String?,
      is_active: (json['is_active'] as num).toInt(),
      is_loggedin: (json['is_loggedin'] as num).toInt(),
      token_id: json['token_id'] as String?,
      bio: BIONetworkEntity.fromJson(json['bio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataNetworkEntityToJson(DataNetworkEntity instance) =>
    <String, dynamic>{
      'access_id': instance.access_id,
      'label_id': instance.label_id,
      'user_id': instance.user_id,
      'login_id': instance.login_id,
      'pass': instance.pass,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'is_active': instance.is_active,
      'is_loggedin': instance.is_loggedin,
      'token_id': instance.token_id,
      'bio': instance.bio,
    };

BIONetworkEntity _$BIONetworkEntityFromJson(Map<String, dynamic> json) =>
    BIONetworkEntity(
      user_id: (json['user_id'] as num).toInt(),
      admin_id: (json['admin_id'] as num?)?.toInt(),
      s_admin_id: (json['s_admin_id'] as num?)?.toInt(),
      school_id: (json['school_id'] as num?)?.toInt(),
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String,
      nic_number: json['nic_number'] as String,
      email: json['email'] as String?,
      contact_1: json['contact_1'] as String,
      contact_2: json['contact_2'] as String?,
      address: json['address'] as String,
      pic: json['pic'] as String?,
      is_active: (json['is_active'] as num).toInt(),
      date_create: json['date_create'] as String,
      date_update: json['date_update'] as String?,
      loc_users: json['loc_users'] == null
          ? null
          : LOCUsersNetworkEntity.fromJson(
              json['loc_users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BIONetworkEntityToJson(BIONetworkEntity instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'admin_id': instance.admin_id,
      's_admin_id': instance.s_admin_id,
      'school_id': instance.school_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'nic_number': instance.nic_number,
      'email': instance.email,
      'contact_1': instance.contact_1,
      'contact_2': instance.contact_2,
      'address': instance.address,
      'pic': instance.pic,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'loc_users': instance.loc_users,
    };

LOCUsersNetworkEntity _$LOCUsersNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    LOCUsersNetworkEntity(
      loc_user_id: (json['loc_user_id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      label_id: (json['label_id'] as num).toInt(),
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      date_create: json['date_create'] as String,
      date_update: json['date_update'] as String?,
    );

Map<String, dynamic> _$LOCUsersNetworkEntityToJson(
        LOCUsersNetworkEntity instance) =>
    <String, dynamic>{
      'loc_user_id': instance.loc_user_id,
      'user_id': instance.user_id,
      'label_id': instance.label_id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
    };
