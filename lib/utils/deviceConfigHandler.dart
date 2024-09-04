import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
// import 'package:smart_van_v2/constants/uiConstants.dart';

class deviceConfig{
  static const screen = _deviceScreen();
  static const navBar = _navigationBar();
  static _screenType screenType = _screenType();



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

class _screenType{
  _screenType();
  //types
  String get WEB => "web";
  String get TABLET => "tablet";
  String get MOBILE => "mobile";
  String get UNKNOWN => "unknown";

  String _type = "unknown";
  String type(BuildContext context){
    if(isWeb()){
      _type = WEB;
    }else{

      if(isTablet(context)){
        _type = TABLET;
      }else if(isMobile(context)){
        _type = MOBILE;
      }else{
        _type = UNKNOWN;
      }
    }

    return _type;
  }
  //--//
  bool isWeb(){
    return kIsWeb;
  }

  bool isTablet(BuildContext context){
    if(kIsWeb){
      return false;
    }else{
      final width = MediaQuery.of(context).size.width;
      return width >= 600;
    }
  }

  bool isMobile(BuildContext context){
    if(kIsWeb){
      return false;
    }else{
      return !isTablet(context) && (Platform.isAndroid || Platform.isIOS);
    }

  }



}




