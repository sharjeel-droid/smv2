import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RepositoryBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginApiResponseNetworkMapper());
    Get.put(AuthRepository(Get.find<AuthApi>(), Get.find<LoginApiResponseNetworkMapper>()));

  }
}