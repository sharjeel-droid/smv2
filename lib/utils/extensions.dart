
//for int to materialColor conversion
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:developer' as dev;
import 'package:crypto/crypto.dart';

extension ColorConversion on Color{
  MaterialColor toMaterialColor(){
    final int red = this.red;
    final int green = this.green;
    final int blue = this.blue;
    final int alpha = this.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(this.value, shades);
  }
}

extension IntToColorConversion on int{
  Color toColor(){
    try{
      return Color(this);
    }
    catch(e){
      return Colors.white;
    }

  }
}

//for encrypting string to md5 encryption
extension StringToMd5 on String{
  String toMD5(){
    if(this!=null && isNotEmpty){
      try{
        return md5.convert(utf8.encode(this)).toString();
      }
      catch(e){
        dev.log("MD5 encryption error -> ${e.toString()}");
        return "";
      }
    }else{
      dev.log("MD5 encryption error -> empty string");
      return "";
    }

  }
}