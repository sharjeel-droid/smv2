import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/apis/dc/DataCentreApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkMapper.dart';
import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:get/get.dart';

import '../network/entities/dc/DCStdDetApiResponseNetworkMapper.dart';
import '../network/entities/dc/DCnewSchoolApiResponseNetworkMapper.dart';

class RepositoryBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginApiResponseNetworkMapper());
    Get.put(DCApiResponseNetworkMapper());
    Get.put(DCnewSchoolApiResponseNetworkMapper());
    Get.put(DCStdDetApiResponseNetworkMapper());
    Get.put(DCnewStdApiResponseNetworkMapper());
    Get.put(AuthRepository(Get.find<AuthApi>(), Get.find<LoginApiResponseNetworkMapper>()));
    Get.put(DataCentreRepository(Get.find<DataCentreApi>(),
        Get.find<DCApiResponseNetworkMapper>(),
        Get.find<DCnewSchoolApiResponseNetworkMapper>(),
        Get.find<DCStdDetApiResponseNetworkMapper>(),
        Get.find<DCnewStdApiResponseNetworkMapper>(),
    ));

  }
}