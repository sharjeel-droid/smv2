import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

class DCApiResponseNetworkMapper implements EntityMapper<DataCentreApiResponseNetworkEntity, DataCentreApiResponseDomainModel>{
  @override
  DataCentreApiResponseDomainModel mapFromEntity(DataCentreApiResponseNetworkEntity entity) {

    return DataCentreApiResponseDomainModel(success: entity.success, message: entity.message,
        data:

        entity.data?.map((e) => DataSchoolsDomainModel(num_of_records: e.num_of_records)).toList()

        );
  }

  @override
  DataCentreApiResponseNetworkEntity mapToEntity(DataCentreApiResponseDomainModel domain) {

    // return DataCentreApiResponseNetworkEntity(success: domain.success);
    return DataCentreApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data:

        domain.data?.map((d) => DataSchoolsNetworkEntity(num_of_records: d.num_of_records)

        ).toList()

    );
  }

}