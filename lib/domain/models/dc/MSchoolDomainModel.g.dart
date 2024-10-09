// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MSchoolDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MSchoolDomainModel _$MSchoolDomainModelFromJson(Map<String, dynamic> json) =>
    MSchoolDomainModel(
      verification_code: (json['verification_code'] as num).toInt(),
      school_name: json['school_name'] as String,
      address: json['address'] as String,
      contact_1: json['contact_1'] as String,
      pic: json['pic'] as String?,
    );

Map<String, dynamic> _$MSchoolDomainModelToJson(MSchoolDomainModel instance) =>
    <String, dynamic>{
      'verification_code': instance.verification_code,
      'school_name': instance.school_name,
      'address': instance.address,
      'contact_1': instance.contact_1,
      'pic': instance.pic,
    };
