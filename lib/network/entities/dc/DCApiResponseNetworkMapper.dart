import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

class DCApiResponseNetworkMapper implements EntityMapper<DataCentreApiResponseNetworkEntity, DataCentreApiResponseDomainModel>{
  @override
  DataCentreApiResponseDomainModel mapFromEntity(DataCentreApiResponseNetworkEntity entity) {

    return DataCentreApiResponseDomainModel(success: entity.success, message: entity.message,
        data: DcDataDomainModel(num_of_records: entity.data!.num_of_records,
            schools:
            entity.data?.schools?.map((e) =>
                SchoolDomainModel(school_id: e.school_id, admin_id: e.admin_id,
                    verification_code: e.verification_code, school_name: e.school_name,
                    address: e.address, contact_1: e.contact_1, is_active: e.is_active,
                    date_create: e.date_create)
            ).toList()
        )
        );
  }

  @override
  DataCentreApiResponseNetworkEntity mapToEntity(DataCentreApiResponseDomainModel domain) {

    // return DataCentreApiResponseNetworkEntity(success: domain.success);
    return DataCentreApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data:
            DcDataNetworkEntity(num_of_records: domain.data!.num_of_records,
                schools: domain.data?.schools?.map((e) =>
                    SchoolNetworkEntity(school_id: e.school_id, admin_id: e.school_id,
                        verification_code: e.verification_code, school_name: e.school_name,
                        address: e.address, contact_1: e.address, is_active: e.school_id,
                        date_create: e.address)).toList()
            )

        // domain.data?.map((d) => DataNetwDataSchoolsNetworkEntity(num_of_records: d.num_of_records)

        // ).toList()

    );
  }

}