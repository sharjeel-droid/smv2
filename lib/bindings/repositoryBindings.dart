import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/apis/dc/DataCentreApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkMapper.dart';
import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RepositoryBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginApiResponseNetworkMapper());
    Get.put(DCApiResponseNetworkMapper());
    Get.put(DCnewSchoolApiResponseNetworkMapper());
    Get.put(AuthRepository(Get.find<AuthApi>(), Get.find<LoginApiResponseNetworkMapper>()));
    Get.put(DataCentreRepository(Get.find<DataCentreApi>(), Get.find<DCApiResponseNetworkMapper>(), Get.find<DCnewSchoolApiResponseNetworkMapper>()));

  }
}