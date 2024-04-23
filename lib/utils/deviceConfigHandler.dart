import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:smart_van_v2/constants/uiConstants.dart';

class deviceConfig{
  static const screen = _deviceScreen();
  static const navBar = _navigationBar();


}

class _deviceScreen{
  const _deviceScreen();

  setToFull(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  setToNormal(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
}

class _navigationBar{
  const _navigationBar();

  setColor({Color? color}){

    final bgColor = color??Colors.blue;
    final iconColorState = Brightness.dark;

    var NavColorSet = SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: bgColor, systemNavigationBarIconBrightness: iconColorState);
    SystemChrome.setSystemUIOverlayStyle(NavColorSet);
  }
}


