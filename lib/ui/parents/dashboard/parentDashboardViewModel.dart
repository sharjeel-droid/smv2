import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/domain/models/dc/DCDriverActiveTripsDataDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';


class ParentDashboardViewModel extends GetxController{
  final DataCentreRepository repo;
  ParentDashboardViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  // RxBool showTripViewAction = false.obs;
  Rxn<DcDriverActiveTripsDataTripDomainModel> activeTripDetails = Rxn();

  // Rxn<DcDriverDashDataSchoolDomainModel> schools = Rxn();
  // Rxn<DcDriverDashDataVehicleDomainModel> vehicle = Rxn();
  // Rxn<DcDriverDashDataRouteDomainModel> route = Rxn();
  // RxList<DcDriverDashDataTripDetsDomainModel> tripToday = RxList();
  // RxList<DcDriverDashDataTripDetsDomainModel> tripActive = RxList();
  // Rxn<DcDriverActiveTripsDataTripDomainModel> activeTripDetails = Rxn();

  init(){

    // ever(activeTripDetails,
    //         (callback) {
    //           showTripViewAction(callback!=null);
    //         }
    //         );

    getActiveTrips();
  }

  getActiveTrips() async
  {

    isProcessing(true);

    // schools(["asd", "123", "523"]);

    int parentId = await AppSession.currentUser.user_id() as int;
    // int userId = 1;


    dev.log("request getActiveTrips; url -> ${ApiConst.BASE_URL}${ApiConst.URL_TRIP_ACTIVE_FOR_PARENT}");
    dev.log("request getActiveTrips; params -> {parentId:${parentId}}");

    repo
        .getParentActiveTrips(
        parentId ,
        onSuccess: (response)
        // async
        {
          // dev.log("on success -> ${response.success}");
          dev.log("response -> ${response.toJson()}");
          // dev.log("response.data -> ${response.data!.toJson()}");

          var data = response;

          if(data == null){
            Fluttertoast.showToast(msg: "no Data Found");
            activeTripDetails(null);
          }else{

            activeTripDetails(data.trip);

          }
          activeTripDetails.refresh();

          // dev.log("tripActive -> ${tripActive.value.length}");
          // dev.log("tripToday -> ${tripToday.value.length}");

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


/*getDashboardDetails() async
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
          tripActive(null);
          tripToday(null);
        }else{

          schools(data.school);
          vehicle(data.vehicle);
          route(data.route);
          tripActive(data.trips!.active);
          tripToday(data.trips!.today);

        }

        dev.log("tripActive -> ${tripActive.value.length}");
        dev.log("tripToday -> ${tripToday.value.length}");

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






}*/

/*startNewTrip({required int route_id, required String trip_course, required Function() onComplete}) async
{

  isProcessing(true);

  // schools(["asd", "123", "523"]);

  // int driverId = await AppSession.currentUser.user_id() as int;
  // int userId = 1;

  String start_time = "";

  dev.log("request DriverDashDet; url -> ${ApiConst.BASE_URL}${ApiConst.URL_DASH_DET_FOR_DRIVER}");
  dev.log("request DriverDashDet; params -> {route_id:${route_id}, trip_course:${trip_course}, start_time, ${start_time}");

  repo
      .startNewTrip(route_id, start_time, trip_course,
      onSuccess: (response)
      // async
      {
        dev.log("on success -> ${response.success}");
        dev.log("response -> ${response.toJson()}");
        dev.log("response.data -> ${response.data!.toJson()}");

        // var data = response.data;
        Fluttertoast.showToast(msg: inforMessages.new_trip_started);
        onComplete();
        // if(data != null){
        //   Fluttertoast.showToast(msg: inforMessages.new_trip_started);
        //   onComplete();
        // }else{
        //
        //   Fluttertoast.showToast(msg: errorMessages.unable_to_process);
        //
        // }

        // dev.log("tripActive -> ${tripActive.value.length}");
        // dev.log("tripToday -> ${tripToday.value.length}");

        isProcessing(false);
      },
      onFailure: (errorMsg){
        dev.log("error message -> ${errorMsg}");
        isProcessing(false);
        Fluttertoast.showToast(
            msg: errorMessages.unable_to_process,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });






}*/




/*
getActiveTrips() async
{

  isProcessing(true);

  // schools(["asd", "123", "523"]);

  int driverId = await AppSession.currentUser.user_id() as int;
  // int userId = 1;


  dev.log("request getActiveTrips; url -> ${ApiConst.BASE_URL}${ApiConst.URL_TRIP_ACTIVE_FOR_DRIVER}");
  dev.log("request getActiveTrips; params -> {driver_id:${driverId}}");

  repo
      .getDriverActiveTrips(
      driverId ,
      onSuccess: (response)
      // async
      {
        // dev.log("on success -> ${response.success}");
        dev.log("response -> ${response.toJson()}");
        // dev.log("response.data -> ${response.data!.toJson()}");

        var data = response;

        if(data == null){
          Fluttertoast.showToast(msg: "no Data Found");
          activeTripDetails(null);
        }else{

          activeTripDetails(data.trip);

        }

        dev.log("tripActive -> ${tripActive.value.length}");
        dev.log("tripToday -> ${tripToday.value.length}");

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






}*/

// bool shouldShowTripView(){
//
//   return (activeTripDetails!=null);
//
// }


}