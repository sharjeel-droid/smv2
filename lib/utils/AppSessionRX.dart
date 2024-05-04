import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class AppSessionRX extends GetxController
{
  AppSessionRX();

  Rx<UserRole> userRoleObs = UserRole.UNKNOWN.obs;

  updUserRole( ){
    _fetchUserRoleFromSession();
    // userRoleObs(userRole);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _fetchUserRoleFromSession();

  }

  _fetchUserRoleFromSession() async
  {
    var userLabel = await AppSession.currentUser.label_id();
    if(userLabel != null){
      dev.log("_userRole() -> userLabel -> ${userLabel}");
      // switch(convertedLID)
      switch(userLabel)
          {
        case 1 :{
          dev.log("_userRole() -> is SA");
          userRoleObs(UserRole.SADMIN) ;
          break;
        }

        case 2 :{
          // return UserRole.ADMIN;
          dev.log("_userRole() -> is AD");
          userRoleObs( UserRole.ADMIN);
          break;
        }

        case 3 :{
          dev.log("_userRole() -> is SU");
          userRoleObs(UserRole.SUPERVISOR);
          break;
        }

        case 4 :{
          dev.log("_userRole() -> is DR");
          userRoleObs(UserRole.DRIVER);
          break;
        }

        case 5 :{
          dev.log("_userRole() -> is PR");
          userRoleObs( UserRole.PARENT);
          break;
        }

        default:{
          dev.log("_userRole() -> is UK");
          userRoleObs(UserRole.UNKNOWN);
          break;
        }
      }
    }else{
      dev.log("_userRole() -> is UK");
      userRoleObs(UserRole.UNKNOWN);
    }

  }
}