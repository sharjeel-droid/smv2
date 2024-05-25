// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataCentreApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCentreApiResponseDomainModel _$DataCentreApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DataCentreApiResponseDomainModel(
      success: json['success'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcDataDomainModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataCentreApiResponseDomainModelToJson(
        DataCentreApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcDataDomainModel _$DcDataDomainModelFromJson(Map<String, dynamic> json) =>
    DcDataDomainModel(
      num_of_records: json['num_of_records'] as int,
      schools: (json['schools'] as List<dynamic>?)
          ?.map((e) => SchoolDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DcDataDomainModelToJson(DcDataDomainModel instance) =>
    <String, dynamic>{
      'num_of_records': instance.num_of_records,
      'schools': instance.schools,
    };

SchoolDomainModel _$SchoolDomainModelFromJson(Map<String, dynamic> json) =>
    SchoolDomainModel(
      school_id: json['school_id'] as int,
      admin_id: json['admin_id'] as int,
      verification_code: json['verification_code'] as int,
      school_name: json['school_name'] as String,
      address: json['address'] as String,
      contact_1: json['contact_1'] as String,
      contact_2: json['contact_2'] as String?,
      pic: json['pic'] as String?,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String,
      supervisor: json['supervisor'] == null
          ? null
          : SupervisorDomainModel.fromJson(
              json['supervisor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchoolDomainModelToJson(SchoolDomainModel instance) =>
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

SupervisorDomainModel _$SupervisorDomainModelFromJson(
        Map<String, dynamic> json) =>
    SupervisorDomainModel(
      user_id: json['user_id'] as int,
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
    );

Map<String, dynamic> _$SupervisorDomainModelToJson(
        SupervisorDomainModel instance) =>
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
