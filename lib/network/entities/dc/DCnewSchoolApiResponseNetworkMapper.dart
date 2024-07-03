import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCnewSchoolApiResponseDomainModel.dart';

class DCnewSchoolApiResponseNetworkMapper implements EntityMapper<DCnewSchoolApiResponseNetworkEntity, DCnewSchoolApiResponseDomainModel>{
  @override
  DCnewSchoolApiResponseDomainModel mapFromEntity(DCnewSchoolApiResponseNetworkEntity entity) {

    return DCnewSchoolApiResponseDomainModel(success: entity.success, message: entity.message);
  }

  @override
  DCnewSchoolApiResponseNetworkEntity mapToEntity(DCnewSchoolApiResponseDomainModel domain) {

    // return DCnewSchoolApiResponseNetworkEntity(success: domain.success);
    return DCnewSchoolApiResponseNetworkEntity(success: domain.success, message: domain.message);
  }

}