import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardView.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardViewModel.dart';
import 'package:SMV2/ui/admin/students/adminStudentsViewModel.dart';
import 'package:SMV2/ui/admin/students/studentWizard/studentWizardViewModel.dart';
import 'package:SMV2/ui/admin/vans/adminVansViewModel.dart';
import 'package:SMV2/ui/admin/vans/vanWizard/vanWizardViewModel.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/ui/drivers/trips/driverTripViewModel.dart';
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
    Get.put<NavDrawerViewModel>(NavDrawerViewModel());//
    Get.put<LoginViewModel>(LoginViewModel(Get.find<AuthRepository>()));//
    Get.put<AdminSchoolViewModel>(AdminSchoolViewModel(Get.find<DataCentreRepository>()));//
    Get.put<AddSchoolWizardViewModel>(AddSchoolWizardViewModel(Get.find<DataCentreRepository>()));//
    Get.put<AdminStudentsViewModel>(AdminStudentsViewModel(Get.find<DataCentreRepository>()));//
    Get.put<StudentWizardViewModel>(StudentWizardViewModel(Get.find<DataCentreRepository>()));//
    Get.put<AdminVansViewModel>(AdminVansViewModel(Get.find<DataCentreRepository>()));//
    Get.put<VanWizardViewModel>(VanWizardViewModel(Get.find<DataCentreRepository>()));//
    //drivers
    Get.put<DriverDashboardViewModel>(DriverDashboardViewModel(Get.find<DataCentreRepository>()));//
    Get.put<DriverTripViewModel>(DriverTripViewModel(Get.find<DataCentreRepository>()));//

  }
}