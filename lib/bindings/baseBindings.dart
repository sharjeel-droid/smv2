import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:SMV2/ui/splash/splashViewModel.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseBindings extends Bindings{
  final context;
  BaseBindings(this.context);

  @override
  void dependencies() {
    Get.put<BuildContext>(context as BuildContext);
    //session shared prefrences
    // Get.put<AppSession>( AppSession() );
    // Get.putAsync<AppSession>(() async => AppSession(await SharedPreferences.getInstance()));
    // Get.putAsync<CurrentUser>(() async => CurrentUser(await SharedPreferences.getInstance()));
  }
}