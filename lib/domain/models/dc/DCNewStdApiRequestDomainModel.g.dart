// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCNewStdApiRequestDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCNewStdApiRequestDomainModel _$DCNewStdApiRequestDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCNewStdApiRequestDomainModel(
      adminId: json['adminId'] as int,
      studentName: json['studentName'] as String,
      schoolId: json['schoolId'] as int,
      fatherName: json['fatherName'] as String,
      fatherNIC: json['fatherNIC'] as String,
      fatherAddress: json['fatherAddress'] as String,
      fatherContact: json['fatherContact'] as String,
    );

Map<String, dynamic> _$DCNewStdApiRequestDomainModelToJson(
        DCNewStdApiRequestDomainModel instance) =>
    <String, dynamic>{
      'adminId': instance.adminId,
      'studentName': instance.studentName,
      'schoolId': instance.schoolId,
      'fatherName': instance.fatherName,
      'fatherNIC': instance.fatherNIC,
      'fatherAddress': instance.fatherAddress,
      'fatherContact': instance.fatherContact,
    };
