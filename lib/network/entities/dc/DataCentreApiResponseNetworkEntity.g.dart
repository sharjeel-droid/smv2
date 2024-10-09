// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataCentreApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCentreApiResponseNetworkEntity _$DataCentreApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DataCentreApiResponseNetworkEntity(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcDataNetworkEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataCentreApiResponseNetworkEntityToJson(
        DataCentreApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcDataNetworkEntity _$DcDataNetworkEntityFromJson(Map<String, dynamic> json) =>
    DcDataNetworkEntity(
      num_of_records: (json['num_of_records'] as num).toInt(),
      schools: (json['schools'] as List<dynamic>?)
          ?.map((e) => SchoolNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DcDataNetworkEntityToJson(
        DcDataNetworkEntity instance) =>
    <String, dynamic>{
      'num_of_records': instance.num_of_records,
      'schools': instance.schools,
    };

SchoolNetworkEntity _$SchoolNetworkEntityFromJson(Map<String, dynamic> json) =>
    SchoolNetworkEntity(
      school_id: (json['school_id'] as num).toInt(),
      admin_id: (json['admin_id'] as num).toInt(),
      verification_code: (json['verification_code'] as num?)?.toInt(),
      school_name: json['school_name'] as String,
      address: json['address'] as String,
      contact_1: json['contact_1'] as String,
      contact_2: json['contact_2'] as String?,
      pic: json['pic'] as String?,
      is_active: (json['is_active'] as num).toInt(),
      date_create: json['date_create'] as String,
      supervisor: json['supervisor'] == null
          ? null
          : SupervisorNetworkEntity.fromJson(
              json['supervisor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchoolNetworkEntityToJson(
        SchoolNetworkEntity instance) =>
    <String, dynamic>{
      'school_id': instance.school_id,
      'admin_id': instance.admin_id,
      'verification_code': instance.verification_code,
      'school_name': instance.school_name,
      'address': instance.address,
      'contact_1': instance.contact_1,
      'contact_2': instance.contact_2,
      'pic': instance.pic,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'supervisor': instance.supervisor,
    };

SupervisorNetworkEntity _$SupervisorNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    SupervisorNetworkEntity(
      user_id: (json['user_id'] as num).toInt(),
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String,
      nic_number: json['nic_number'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      contact_1: json['contact_1'] as String?,
      contact_2: json['contact_2'] as String?,
      pic: json['pic'] as String?,
      is_active: (json['is_active'] as num).toInt(),
    );

Map<String, dynamic> _$SupervisorNetworkEntityToJson(
        SupervisorNetworkEntity instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
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
    };
