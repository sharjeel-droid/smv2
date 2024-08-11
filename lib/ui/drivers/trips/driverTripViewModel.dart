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


class DriverTripViewModel extends GetxController{
  final DataCentreRepository repo;
  DriverTripViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  Rxn<DcDriverActiveTripsDataTripDomainModel> activeTripDetails = Rxn();

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

  updateStudentTripStatus(
      {required int studentId,
        required String status,
        String? reason = null}
      ) async
  {

    if(activeTripDetails==null){
      return null;
    }



    isProcessing(true);

    int trip_id = activeTripDetails.value?.trip_id ?? 0;


    dev.log("request updateStudentTripStatus; url -> ${ApiConst.BASE_URL}${ApiConst.URL_UPD_STUDENT_TRIP_STATUS}");
    dev.log("request updateStudentTripStatus; params -> {trip_id:${trip_id}}");
    dev.log("request updateStudentTripStatus; params -> {studentId:${studentId}}");
    dev.log("request updateStudentTripStatus; params -> {status:${status}}");
    dev.log("request updateStudentTripStatus; params -> {reason:${reason}}");

    repo
        .updateStudentTripStatus(
        trip_id,
        studentId,
        status,
        reason,
        onSuccess: (response)
        // async
        {
          // dev.log("on success -> ${response.success}");
          dev.log("response -> ${response.toJson()}");
          // dev.log("response.data -> ${response.data!.toJson()}");

          // var data = response;

          if(response.success == 1){
            // Fluttertoast.showToast(msg: "no Data Found");
            // activeTripDetails(null);
            _updateStudentStatusInObservable(studentId, status, reason);
          }else{
            Fluttertoast.showToast(msg: errorMessages.unable_to_update_stat);
            // activeTripDetails(data.trip);

          }

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

  _updateStudentStatusInObservable(int studentId, String status, String? reason){

    dev.log("current time of pickup -> ${DateTime.timestamp().toString()}");
    for(final std in activeTripDetails.value?.students ?? List<DcDriverActiveTripsDataTripStudentsDomainModel>.empty()){

      if(std.student_id == studentId){

        std.status = status;
        std.reason = reason;
        std.time_pickup = DateTime.timestamp().toString();

      }
    }
  }

  finishTrip(
      {required int trip_id,
        required Function() onComplete
      }
      ) async
  {

    if(activeTripDetails==null){
      return null;
    }



    isProcessing(true);

    int trip_id = activeTripDetails.value?.trip_id ?? 0;
    String time_end = "";

    dev.log("request updateStudentTripStatus; url -> ${ApiConst.BASE_URL}${ApiConst.URL_UPD_STUDENT_TRIP_STATUS}");
    dev.log("request updateStudentTripStatus; params -> {trip_id:${trip_id}}");

    repo
        .finishTrip(
        trip_id,
        time_end,
        onSuccess: (response)
        // async
        {
          // dev.log("on success -> ${response.success}");
          dev.log("response -> ${response.toJson()}");
          // dev.log("response.data -> ${response.data!.toJson()}");

          // var data = response;

          if(response.success == 1){
            Fluttertoast.showToast(msg: inforMessages.trip_finished);
            onComplete();
          }else{
            Fluttertoast.showToast(msg: errorMessages.unable_to_process);

          }
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






  }


}