import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCnewSchoolApiResponseDomainModel.dart';
import '../../../domain/models/dc/DCnewStdApiResponseDomainModel.dart';

class DCnewStdApiResponseNetworkMapper implements EntityMapper<DCnewStdApiResponseNetworkEntity, DCnewStdApiResponseDomainModel>{
  @override
  DCnewStdApiResponseDomainModel mapFromEntity(DCnewStdApiResponseNetworkEntity entity) {

    return DCnewStdApiResponseDomainModel(success: entity.success, message: entity.message);
  }

  @override
  DCnewStdApiResponseNetworkEntity mapToEntity(DCnewStdApiResponseDomainModel domain) {

    // return DCnewSchoolApiResponseNetworkEntity(success: domain.success);
    return DCnewStdApiResponseNetworkEntity(success: domain.success, message: domain.message);
  }

}