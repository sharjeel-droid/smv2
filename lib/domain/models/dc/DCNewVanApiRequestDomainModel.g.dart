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
      students: (json['students'] as List<dynamic>)
          .map((e) => DCNewVanApiStdRequestDomainModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
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

DCNewVanApiStdRequestDomainModel _$DCNewVanApiStdRequestDomainModelFromJson(
        Map<String, dynamic> json) =>
    DCNewVanApiStdRequestDomainModel(
      studentId: json['studentId'] as int,
      sortingIndex: json['sortingIndex'] as int,
    );

Map<String, dynamic> _$DCNewVanApiStdRequestDomainModelToJson(
        DCNewVanApiStdRequestDomainModel instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'sortingIndex': instance.sortingIndex,
    };
