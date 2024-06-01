import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCnewVanApiResponseDomainModel.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewVanApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCnewSchoolApiResponseDomainModel.dart';
import '../../../domain/models/dc/DCnewStdApiResponseDomainModel.dart';

class DCnewVanApiResponseNetworkMapper implements EntityMapper<DCnewVanApiResponseNetworkEntity, DCnewVanApiResponseDomainModel>{
  @override
  DCnewVanApiResponseDomainModel mapFromEntity(DCnewVanApiResponseNetworkEntity entity) {

    return DCnewVanApiResponseDomainModel(success: entity.success, message: entity.message);
  }

  @override
  DCnewVanApiResponseNetworkEntity mapToEntity(DCnewVanApiResponseDomainModel domain) {

    // return DCnewSchoolApiResponseNetworkEntity(success: domain.success);
    return DCnewVanApiResponseNetworkEntity(success: domain.success, message: domain.message);
  }

}