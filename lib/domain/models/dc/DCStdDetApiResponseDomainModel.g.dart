// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCStdDetApiResponseDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCStdDetApiResponseDomainModel _$DCStdDetApiResponseDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCStdDetApiResponseDomainModel(
      success: (json['success'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DcStudentsDataDomainModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DCStdDetApiResponseDomainModelToJson(
        DCStdDetApiResponseDomainModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DcStudentsDataDomainModel _$DcStudentsDataDomainModelFromJson(
        Map<String, dynamic> json) =>
    DcStudentsDataDomainModel(
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentsDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DcStudentsDataDomainModelToJson(
        DcStudentsDataDomainModel instance) =>
    <String, dynamic>{
      'students': instance.students,
    };

StudentsDomainModel _$StudentsDomainModelFromJson(Map<String, dynamic> json) =>
    StudentsDomainModel(
      student_id: (json['student_id'] as num).toInt(),
      admin_id: (json['admin_id'] as num).toInt(),
      school_id: (json['school_id'] as num).toInt(),
      father_id: (json['father_id'] as num).toInt(),
      mother_id: (json['mother_id'] as num?)?.toInt(),
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String,
      pic: json['pic'] as String?,
      is_active: (json['is_active'] as num).toInt(),
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
      school_name: json['school_name'] as String?,
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => ParentsDomainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentsDomainModelToJson(
        StudentsDomainModel instance) =>
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

ParentsDomainModel _$ParentsDomainModelFromJson(Map<String, dynamic> json) =>
    ParentsDomainModel(
      user_id: (json['user_id'] as num).toInt(),
      admin_id: (json['admin_id'] as num).toInt(),
      school_id: (json['school_id'] as num).toInt(),
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
      date_create: json['date_create'] as String?,
      date_update: json['date_update'] as String?,
    );

Map<String, dynamic> _$ParentsDomainModelToJson(ParentsDomainModel instance) =>
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
