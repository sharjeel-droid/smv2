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


class ParentTripViewModel extends GetxController{
  final DataCentreRepository repo;
  ParentTripViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  RxBool showTripViewAction = false.obs;
  Rxn<DcDriverActiveTripsDataTripDomainModel> activeTripDetails = Rxn();

  init(){

    ever(activeTripDetails,
            (callback) {
          showTripViewAction(callback!=null);
        }
    );

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


}