import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import 'package:get/get_rx/get_rx.dart';


class DriverDashboardViewModel extends GetxController{
  final DataCentreRepository repo;
  DriverDashboardViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  Rxn<DcDriverDashDataSchoolDomainModel> schools = Rxn();
  Rxn<DcDriverDashDataVehicleDomainModel> vehicle = Rxn();
  Rxn<DcDriverDashDataRouteDomainModel> route = Rxn();




getDashboardDetails() async
{

  isProcessing(true);

  // schools(["asd", "123", "523"]);

  int driverId = await AppSession.currentUser.user_id() as int;
  // int userId = 1;


  dev.log("request DriverDashDet; url -> ${ApiConst.BASE_URL}${ApiConst.URL_DASH_DET_FOR_DRIVER}");
  dev.log("request DriverDashDet; params -> {driver_id:${driverId}}");

  repo
      .getDriverDashboardDetails(
      driverId ,
      onSuccess: (response)
      // async
      {
        dev.log("on success -> ${response.success}");
        dev.log("response -> ${response.toJson()}");
        dev.log("response.data -> ${response.data!.toJson()}");

        var data = response.data;

        if(data == null){
          Fluttertoast.showToast(msg: "no Data Found");
          schools(null);
          vehicle(null);
          route(null);
        }else{

          schools(data.school);
          vehicle(data.vehicle);
          route(data.route);

        }

        isProcessing(false);
      },
      onFailure: (errorMsg){
        dev.log("error message -> ${errorMsg}");
        isProcessing(false);
        Fluttertoast.showToast(
            msg: "Error in fethcing dashboard details",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });






}



}