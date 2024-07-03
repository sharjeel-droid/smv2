import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DCVanDetApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import '../../../domain/models/dc/DCStdDetApiResponseDomainModel.dart';


class AdminVansViewModel extends GetxController{
  final DataCentreRepository repo;
  AdminVansViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  RxList<VehiclesDomainModel> vehicles = RxList<VehiclesDomainModel>();


getVans() async
{

  isProcessing(true);

  int userId = await AppSession.currentUser.user_id() as int;

  dev.log("requestVans; url -> ${ApiConst.BASE_URL}${ApiConst.URL_STUDENT_DETS_FOR_ADMINS}");

  repo.getVanDetails(userId,
      onSuccess: (response)
      // async
      {
        dev.log("on success -> ${response.success}");
        dev.log("on message -> ${response.message}");

        var data = response.data;

        if(data == null){
          Fluttertoast.showToast(msg: "no Data Found");
          vehicles!(null);
        }else{

          vehicles!(data.vehicles);
        }


        isProcessing(false);
      },
      onFailure: (errorMsg){
        dev.log("error message -> ${errorMsg}");
        isProcessing(false);
        Fluttertoast.showToast(
            msg: "Error in fethcing VAN details",
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