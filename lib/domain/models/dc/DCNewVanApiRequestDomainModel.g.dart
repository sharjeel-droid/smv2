// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DCNewVanApiRequestDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCNewVanApiRequestDomainModel _$DCNewVanApiRequestDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCNewVanApiRequestDomainModel(
      adminId: json['adminId'] as int,
      schoolId: json['schoolId'] as int,
      vehicleRegNum: json['vehicleRegNum'] as String,
      vehicleType: json['vehicleType'] as String,
      driverName: json['driverName'] as String,
      driverNIC: json['driverNIC'] as String,
      driverContact: json['driverContact'] as String,
      students: json['students'] as String,
    );

Map<String, dynamic> _$DCNewVanApiRequestDomainModelToJson(
        DCNewVanApiRequestDomainModel instance) =>
    <String, dynamic>{
      'adminId': instance.adminId,
      'schoolId': instance.schoolId,
      'vehicleRegNum': instance.vehicleRegNum,
      'vehicleType': instance.vehicleType,
      'driverName': instance.driverName,
      'driverNIC': instance.driverNIC,
      'driverContact': instance.driverContact,
      'students': instance.students,
    };
