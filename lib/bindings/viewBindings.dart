import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardView.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardViewModel.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:SMV2/ui/navigationDrawer/navDrawerViewModel.dart';
import 'package:SMV2/ui/splash/splashViewModel.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewBindings extends Bindings{
  @override
  void dependencies() {

    //viewModels
    Get.put<SplashViewModel>(SplashViewModel());//
    Get.put<LoginViewModel>(LoginViewModel(Get.find<AuthRepository>()));//
    Get.put<AdminSchoolViewModel>(AdminSchoolViewModel(Get.find<DataCentreRepository>()));//
    Get.put<AddSchoolWizardViewModel>(AddSchoolWizardViewModel(Get.find<DataCentreRepository>()));//
    Get.put<NavDrawerViewModel>(NavDrawerViewModel());//
  }
}