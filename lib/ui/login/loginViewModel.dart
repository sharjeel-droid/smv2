// import 'dart:ffi';

import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/repositories/AuthRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:SMV2/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as dev;

import 'package:get/get.dart';


class LoginViewModel extends GetxController{
  final AuthRepository repo;
  LoginViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//
  final _formKey_login = GlobalKey<FormState>();
  loginFormKey(){return _formKey_login;}
  //-non-observables-//

  //observables
  RxString userName = "".obs;
  RxString password = "".obs;
  RxBool isProcessing = false.obs;
  RxBool showPass = false.obs;
  RxBool doRememberMe = false.obs;


  handleUserNameChanges(String? updatedValue){
    userName(updatedValue);
  }

  handlePasswordChanges(String? updatedValue){
    password(updatedValue);
  }


  checkLogin(){


    final FormState? _form = _formKey_login.currentState;

    if(_form !. validate())
    {
      if(userName!=null && password!=null){
        isProcessing(true);

        dev.log("started");

        _form.save();
        dev.log("uname -> ${userName}, pass -> ${password}");

        requestLogin();

      }

    }
  }

  requestLogin(){

    dev.log("requestLogin; url -> ${ApiConst.BASE_URL}${ApiConst.URL_LOGIN}");
    dev.log("requestLogin; params -> {username:${userName.value}, password:${password.value.toMD5()}}");

    repo.checkLogin(
        userName.value,
        password.value.toMD5(),
        onSuccess: (response)
        async
        {
          dev.log("on success -> ${response.success}");
          dev.log("on success user's name -> ${response.data?[0].bio.first_name}");

          var data = response.data?[0];

          if(data!=null){
            dev.log("data found.");
            //putting in session

            // Get.find<AppSession>()

            await AppSession
                .currentUser
                .handleCurrentUserData(
                    access_id: data.access_id,
                    label_id: data.label_id,
                    user_id: data.user_id,
                    login_id: data.login_id,
                    token_id: data.token_id,
                    admin_id: data.bio.admin_id ?? 0,
                    s_admin_id: data.bio.s_admin_id ?? 0,
                    school_id: data.bio.school_id ?? 0,
                    first_name: data.bio.first_name,
                    last_name: data.bio.last_name,
                    gender: data.bio.gender,
                    nic_number: data.bio.nic_number,
                    email: data.bio.email,
                    contact1: data.bio.contact_1,
                    contact2: data.bio.contact_2,
                    address: data.bio.address,
                    pic: data.bio.pic,
                    longitude: data.bio.loc_users?.longitude,
                    latitude: data.bio.loc_users?.latitude
                );

            dev.log('session added');

            navigate().toHome(/*context: _context*/);



          }


          isProcessing(false);
          },
        onFailure: (errorMsg){
          dev.log("error message -> ${errorMsg}");
          isProcessing(false);
          Fluttertoast.showToast(
              msg: "invalid credentials",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });

  }

  // setPassVisibility(bool shouldShow){showPass.value=shouldShow;}
  changePassVisibility(){showPass.value=!showPass.value;}
  changeRememberMeCheck(){doRememberMe.value=!doRememberMe.value;}


  /*Future<String>*/
  // fetchTest()
  // async
  // {
  //   try{
  //     // String resp = await AuthRepository().checkLogin();
  //     _resp.value = "hello world again";
  //   }
  //   catch(e){
  //     dev.log('error -> ${e.toString()}');
  //   }
  //   // notifyListeners();
  // }


}



// class LoginViewModel with ChangeNotifier{
//
//   var _resp = "";
//
//   /*Future<String>*/
//   fetchTest()
//   async
//   {
//     try{
//       String resp = await AuthRepository().checkLogin();
//       _resp = resp;
//     }
//     catch(e){
//       dev.log('error -> ${e.toString()}');
//     }
//     notifyListeners();
//   }
//
//
// }