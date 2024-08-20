import 'package:intl/intl.dart';
import 'dart:developer' as dev;

class DateTimeHandler{

  static final TAG = "DateTimeHandler.dart";

  static String dateTimeNow_ymd(){

    var dttm = "";

    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    dttm = formatter.format(DateTime.now());

    dev.log(TAG+">dateTimeNow_ymd -> ${dttm}");

    return dttm;


  }

  static String dateTime_ymd_to_hm(String ymd_hms){
    String timeCalculated = "";

    DateTime dttm = DateTime.parse(ymd_hms);

    timeCalculated = DateFormat('HH:mm').format(dttm);

    return timeCalculated;
  }


}