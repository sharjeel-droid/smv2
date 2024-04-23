import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class NetworkBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<Dio>(Dio());//Dart DIO
    //auth api service
    Get.put(AuthApi(Get.find<Dio>()));


  }
}