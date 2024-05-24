// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCNewSchoolApiRequestDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCNewSchoolApiRequestDomainModel _$DCNewSchoolApiRequestDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCNewSchoolApiRequestDomainModel(
      adminId: json['adminId'] as int,
      schoolName: json['schoolName'] as String,
      schoolAddress: json['schoolAddress'] as String,
      schoolContact: json['schoolContact'] as String,
      supervisorName: json['supervisorName'] as String,
      supervisorNIC: json['supervisorNIC'] as String,
      supervisorEmail: json['supervisorEmail'] as String,
      supervisorAddress: json['supervisorAddress'] as String,
      supervisorContact: json['supervisorContact'] as String,
    );

Map<String, dynamic> _$DCNewSchoolApiRequestDomainModelToJson(
        DCNewSchoolApiRequestDomainModel instance) =>
    <String, dynamic>{
      'adminId': instance.adminId,
      'schoolName': instance.schoolName,
      'schoolAddress': instance.schoolAddress,
      'schoolContact': instance.schoolContact,
      'supervisorName': instance.supervisorName,
      'supervisorNIC': instance.supervisorNIC,
      'supervisorEmail': instance.supervisorEmail,
      'supervisorAddress': instance.supervisorAddress,
      'supervisorContact': instance.supervisorContact,
    };
