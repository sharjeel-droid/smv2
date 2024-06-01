import 'package:SMV2/domain/models/dc/DCVanDetApiResponseDomainModel.dart';
import 'package:SMV2/network/entities/dc/DCVanDetApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCStdDetApiResponseDomainModel.dart';
import 'DCStdDetApiResponseNetworkEntity.dart';

class DCVanDetApiResponseNetworkMapper implements EntityMapper<DCVanDetApiResponseNetworkEntity, DCVanDetApiResponseDomainModel>{
  @override
  DCVanDetApiResponseDomainModel mapFromEntity(DCVanDetApiResponseNetworkEntity entity) {

    return DCVanDetApiResponseDomainModel(success: entity.success, message: entity.message,
        data: DcVanDataDomainModel(
            vehicles:
            entity.data?.vehicles?.map((e) =>
                VehiclesDomainModel(vehicle_id: e.vehicle_id, admin_id : e.admin_id,school_id: e.school_id,
                    driver_id: e.driver_id, vehicle_type: e.vehicle_type,
                    reg_number:e.reg_number, is_active: e.is_active,
                    date_create: e.date_create, date_update: e.date_update,
                    school_name: e.school_name,
                    driver: (e.driver==null)?null:
                    DriverDomainModel(user_id: e.driver!.user_id, admin_id: e.driver!.admin_id, school_id: e.driver!.school_id, vehicle_id: e.driver!.vehicle_id,
                        first_name: e.driver!.first_name, gender: e.driver!.first_name, is_active: e.driver!.is_active)
                  ,route: e.route==null ? null :
                    RouteDomainModel(route_id: e.route!.route_id, vehicle_id: e.route!.vehicle_id, driver_id: e.route!.driver_id, school_id: e.route!.school_id, is_active: e.route!.is_active)



                )
            ).toList()
        )
        );
  }

  @override
  DCVanDetApiResponseNetworkEntity mapToEntity(DCVanDetApiResponseDomainModel domain) {

    // return DataCentreApiResponseNetworkEntity(success: domain.success);
    return DCVanDetApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data:
            DcVanDataNetworkEntity(
                vehicles:
                domain.data?.vehicles?.map((e) =>
                    VehiclesNetworkEntity(vehicle_id: e.vehicle_id, admin_id:e.admin_id,
                        school_id: e.school_id, driver_id: e.driver_id, vehicle_type: e.vehicle_type,
                        is_active: e.is_active, date_create:e.date_create, date_update: e.date_update,
                        school_name: e.school_name,
                      driver: e.driver==null ? null :
                      DriverNetworkEntity(user_id: e.driver!.user_id, admin_id: e.driver!.admin_id,
                          school_id: e.driver!.school_id, vehicle_id: e.driver!.vehicle_id,
                          first_name: e.driver!.first_name, gender: e.driver!.gender, is_active: e.driver!.is_active),
                      // e.driver!.map((e2) =>
                      //
                      //
                      //     DriverNetworkEntity(user_id: e2.user_id, admin_id: e2.admin_id,
                      //         school_id: e2.school_id, vehicle_id: e2.vehicle_id,
                      //         first_name: e2.first_name, gender: e2.gender, is_active: e2.is_active)
                      // ).toList(),

                      route: e.route == null ? null :
                      RouteNetworkEntity(route_id: e.route!.route_id, vehicle_id: e.route!.vehicle_id, driver_id: e.route!.driver_id, school_id: e.route!.school_id, is_active: e.route!.is_active)

                        // e.route!.map((e2) =>
                        //     RouteNetworkEntity(route_id: e2.route_id, vehicle_id: e2.vehicle_id, driver_id: e2.driver_id, school_id: e2.school_id, is_active: e2.is_active)
                        //
                        // ).toList()


                    )).toList()
            )

        // domain.data?.map((d) => DataNetwDataSchoolsNetworkEntity(num_of_records: d.num_of_records)

        // ).toList()

    );
  }

}