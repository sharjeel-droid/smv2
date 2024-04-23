import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

class SplashViewModel extends GetxController{
  // CurrentUser sess;
  // SplashViewModel(this.sess);
  //observables
  RxBool isProcessing = false.obs;

  checkSessionAndNavigate()
  async
  {
    dev.log('processing');

    isProcessing(true);

    dev.log('find start');
    bool isSessPresent = await AppSession.currentUser.isUserSessionPresent();
    dev.log('find done');
    await Future.delayed(Duration(milliseconds: 3000), (){});
    isProcessing(false);

    dev.log('checkSessionAndNavigate -> ${isSessPresent}');
    if(isSessPresent){
      navigate().toHome();
      // dev.log('navigating to home');
    }else{
      navigate().toLogin();
      // dev.log('navigating to login');
    }




  }




}