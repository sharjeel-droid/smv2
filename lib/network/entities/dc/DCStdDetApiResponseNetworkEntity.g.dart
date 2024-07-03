// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCStdDetApiResponseNetworkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCStdDetApiResponseNetworkEntity _$DCStdDetApiResponseNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DCStdDetApiResponseNetworkEntity(
      success: json['success'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcStudentsDataNetworkEntity.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DCStdDetApiResponseNetworkEntityToJson(
        DCStdDetApiResponseNetworkEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcStudentsDataNetworkEntity _$DcStudentsDataNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    DcStudentsDataNetworkEntity(
      students: (json['students'] as List<dynamic>?)
          ?.map(
              (e) => StudentsNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DcStudentsDataNetworkEntityToJson(
        DcStudentsDataNetworkEntity instance) =>
    <String, dynamic>{
      'students': instance.students,
    };

StudentsNetworkEntity _$StudentsNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    StudentsNetworkEntity(
      student_id: json['student_id'] as int,
      admin_id: json['admin_id'] as int,
      school_id: json['school_id'] as int,
      father_id: json['father_id'] as int,
      mother_id: json['mother_id'] as int?,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String,
      pic: json['pic'] as String?,
      is_active: json['is_active'] as int,
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
      school_name: json['school_name'] as String?,
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => ParentsNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentsNetworkEntityToJson(
        StudentsNetworkEntity instance) =>
    <String, dynamic>{
      'student_id': instance.student_id,
      'admin_id': instance.admin_id,
      'school_id': instance.school_id,
      'father_id': instance.father_id,
      'mother_id': instance.mother_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'pic': instance.pic,
      'is_active': instance.is_active,
      'date_create': instance.date_create,
      'date_update': instance.date_update,
      'school_name': instance.school_name,
      'parents': instance.parents,
    };

ParentsNetworkEntity _$ParentsNetworkEntityFromJson(
        Map<String, dynamic> json) =>
    ParentsNetworkEntity(
      user_id: json['user_id'] as int,
      admin_id: json['admin_id'] as int,
      school_id: json['school_id'] as int,
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
    );

Map<String, dynamic> _$ParentsNetworkEntityToJson(
        ParentsNetworkEntity instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'admin_id': instance.admin_id,
      'school_id': instance.school_id,
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
    };
