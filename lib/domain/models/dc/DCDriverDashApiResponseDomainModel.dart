import 'package:json_annotation/json_annotation.dart';

part 'DCDriverDashApiResponseDomainModel.g.dart';

@JsonSerializable()
class DCDriverDashApiResponseDomainModel{
  int success;
  String message;
  DcDriverDashDataDomainModel? data;

  DCDriverDashApiResponseDomainModel({required this.success, required this.message, this.data});

  factory DCDriverDashApiResponseDomainModel.fromJson(Map<String, dynamic> json) => _$DCDriverDashApiResponseDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DCDriverDashApiResponseDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverDashDataDomainModel{
  // int num_of_records;
  DcDriverDashDataSchoolDomainModel? school;
  DcDriverDashDataVehicleDomainModel? vehicle;
  DcDriverDashDataRouteDomainModel? route;

  DcDriverDashDataDomainModel({this.school, this.vehicle, this.route});

  factory DcDriverDashDataDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverDashDataSchoolDomainModel{
  // int num_of_records;
  String? verification_code;
  String? school_name;
  String? address;
  String? contact_1;
  String? pic;

  DcDriverDashDataSchoolDomainModel({this.verification_code, this.school_name, this.address, this.contact_1, this.pic});

  factory DcDriverDashDataSchoolDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataSchoolDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataSchoolDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverDashDataVehicleDomainModel{
  // int num_of_records;
  String? vehicle_type;
  String? reg_number;

  DcDriverDashDataVehicleDomainModel({this.vehicle_type, this.reg_number});

  factory DcDriverDashDataVehicleDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataVehicleDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataVehicleDomainModelToJson(this);
}


@JsonSerializable()
class DcDriverDashDataRouteDomainModel{
  // int num_of_records;
  int route_id;
  String? route_title;
  String? time_start_approx;
  String? time_end_approx;

  DcDriverDashDataRouteDomainModel({required this.route_id, this.route_title, this.time_start_approx, this.time_end_approx});

  factory DcDriverDashDataRouteDomainModel.fromJson(Map<String, dynamic> json) => _$DcDriverDashDataRouteDomainModelFromJson(json);
  Map<String, dynamic> toJson() => _$DcDriverDashDataRouteDomainModelToJson(this);
}