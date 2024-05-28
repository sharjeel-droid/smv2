import 'dart:developer' as dev;

import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardView.dart';
import 'package:SMV2/ui/admin/students/studentWizard/studentWizardView.dart';
import 'package:SMV2/ui/mapsandplaces/addressPickerView.dart';
import 'package:SMV2/ui/navigationDrawer/navDrawerView.dart';
import 'package:SMV2/ui/splash/splashView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

import '../ui/about/aboutView.dart';
import '../ui/login/loginView.dart';
import '../ui/settings/settingsView.dart';
class navigate{
  const navigate();

  static String initialRoute = _splash().routeName();

  static List<GetPage<dynamic>> pagesList = [
    GetPage(name: _splash().routeName(), page: () => _splash().routePage()),
    GetPage(name: _login().routeName(), page: () => _login().routePage()),
    GetPage(name: _home().routeName(), page: () => _home().routePage()),
    GetPage(name: _about().routeName(), page: () => _about().routePage()),
    GetPage(name: _settings().routeName(), page: () => _settings().routePage()),
  ];


   toLogin(/*{required context}*/){
     Get.off(_login().routePage());
   }
   toHome(/*{required context}*/){
     Get.off(_home().routePage());
   }
   toAbout(/*{required context}*/){
     // dev.log('navigating to about page');
     Get.to(_about().routePage());
   }
   toSettings(/*{required context}*/){
     Get.to(_settings().routePage());
   }
   toSchoolWizard(/*{required context}*/){
     Get.to(_schoolWizard().routePage());
   }
   toAddressPicker(/*{required context}*/){
     Get.to(_addressPicker().routePage());
   }
   toStudentWizard(/*{required context}*/){
     Get.to(_studentWizard().routePage());
   }
   back(/*{required context}*/){
     Get.back();//to(_schoolWizard().routePage());
   }

}

//get x navigation
class _splash implements getXNavGetter{
  @override
  String routeName() {
    return "/";
  }

  @override
  routePage() {
    return SplashView();
  }

}
class _login implements getXNavGetter{
  _login();

  @override
  LoginView routePage() {
    return LoginView();
  }

  @override
  String routeName() {
    return "/login";
  }

}
class _home implements getXNavGetter{
  @override
  String routeName() {
    return "/home";
  }

  @override
  routePage() {
    return NavigationDrawerView();
  }

}
class _about implements getXNavGetter{
  @override
  String routeName() {
    return '/about';
  }

  @override
  Widget routePage() {
    return AboutView();
  }

}
class _settings implements getXNavGetter{
  @override
  String routeName() {
    return "/settings";
  }

  @override
  Widget routePage() {
    return SettingsView();
  }

}
class _schoolWizard implements getXNavGetter{
  @override
  String routeName() {
    return "/schoolWizard";
  }

  @override
  Widget routePage() {
    return AddSchoolWizardView();
  }

}
class _addressPicker implements getXNavGetter{
  @override
  String routeName() {
    return "/addressPicker";
  }

  @override
  Widget routePage() {
    return AddressPickerView();
  }

}

class _studentWizard implements getXNavGetter{
  @override
  String routeName() {
    return "/studentWizard";
  }

  @override
  Widget routePage() {
    return StudentWizardView();
  }

}

abstract class getXNavGetter{
  String routeName();
  Widget routePage();
}

//--//




// class _toLogin {
//   _toLogin();
//   handle({required context}){
//     _navigationHandler().navigateNow(context: context, screen: LoginView());
//   }
// }
//
// class _toHome {
//   _toHome();
//   handle({required context}){
//     _navigationHandler().navigateNow(context: context, screen: NavigationDrawerView());
//   }
// }
//
// class _toAbout {
//   _toAbout();
//   handle({required context}){
//     // _navigationHandler().navigateNow(context: context, screen: AboutView());
//     _navigationHandler().navigateNowWBackStack(context: context, screen: AboutView());
//   }
// }
//
// class _toSettings {
//   _toSettings();
//   handle({required context}){
//     // _navigationHandler().navigateNow(context: context, screen: SettingsView());
//     _navigationHandler().navigateNowWBackStack(context: context, screen: SettingsView());
//   }
// }
//
// //base class for handling navigation
// // class interface_navgationHandler{
// class _navigationHandler{
//   void navigateNow({required var context, required var screen}){
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen ));
//   }
//   void navigateNowWBackStack({required var context, required var screen}){
//     Navigator.push(context, MaterialPageRoute(builder: (context) => screen ));
//   }
// }