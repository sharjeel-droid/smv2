import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCStdDetApiResponseDomainModel.dart';

class DCDriverDashApiResponseNetworkMapper implements EntityMapper<DCDriverDashApiResponseNetworkEntity, DCDriverDashApiResponseDomainModel>{
  @override
  DCDriverDashApiResponseDomainModel mapFromEntity(DCDriverDashApiResponseNetworkEntity entity) {

    return DCDriverDashApiResponseDomainModel(success: entity.success, message: entity.message,
        data: DcDriverDashDataDomainModel(
          school: DcDriverDashDataSchoolDomainModel(
            verification_code: entity.data?.school?.verification_code,
            school_name: entity.data?.school?.school_name,
            address: entity.data?.school?.address,
            contact_1: entity.data?.school?.contact_1,
            pic: entity.data?.school?.pic
          ),
            vehicle: DcDriverDashDataVehicleDomainModel(
              vehicle_type: entity.data?.vehicle?.vehicle_type,
              reg_number: entity.data?.vehicle?.reg_number
            ),
            route: DcDriverDashDataRouteDomainModel(route_id: entity.data!.route!.route_id,
              route_title: entity.data?.route?.route_title,
              time_start_approx: entity.data?.route?.time_start_approx,
              time_end_approx: entity.data?.route?.time_end_approx
            ),
        )
        );
  }

  @override
  DCDriverDashApiResponseNetworkEntity mapToEntity(DCDriverDashApiResponseDomainModel domain) {

    // return DataCentreApiResponseNetworkEntity(success: domain.success);
    return DCDriverDashApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data:
        DcDriverDashDataNetworkEntity(
          school: DcDriverDashDataSchoolNetworkEntity(
              verification_code: domain.data?.school?.verification_code,
              school_name: domain.data?.school?.school_name,
              address: domain.data?.school?.address,
              contact_1: domain.data?.school?.contact_1,
              pic: domain.data?.school?.pic
          ),
          vehicle: DcDriverDashDataVehicleNetworkEntity(
              vehicle_type: domain.data?.vehicle?.vehicle_type,
              reg_number: domain.data?.vehicle?.reg_number
          ),
          route: DcDriverDashDataRouteNetworkEntity(route_id: domain.data!.route!.route_id,
              route_title: domain.data?.route?.route_title,
              time_start_approx: domain.data?.route?.time_start_approx,
              time_end_approx: domain.data?.route?.time_end_approx
          ),
        )

        // domain.data?.map((d) => DataNetwDataSchoolsNetworkEntity(num_of_records: d.num_of_records)

        // ).toList()

    );
  }

}