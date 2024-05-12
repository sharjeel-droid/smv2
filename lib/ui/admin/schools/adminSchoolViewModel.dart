import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;


class AdminSchoolViewModel extends GetxController{
  final DataCentreRepository repo;
  AdminSchoolViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
//--//

//observables
  RxBool isProcessing = false.obs;
RxList<DataSchoolsDomainModel?> schools = [null].obs;


getSchools() async
{

  isProcessing(true);

  // schools(["asd", "123", "523"]);

int userId = await AppSession.currentUser.user_id() as int;


  dev.log("requestLogin; url -> ${ApiConst.BASE_URL}${ApiConst.URL_LOGIN}");
  dev.log("requestLogin; params -> {admin_id:${userId}}");

  repo.getSchoolDetails(userId,
      onSuccess: (response)
      // async
      {
        dev.log("on success -> ${response.success}");

        var data = response.data;

        if(data == null){
          Fluttertoast.showToast(msg: "no Data Found");
          schools(null);
        }else{
          if(data.isEmpty){
            Fluttertoast.showToast(msg: "no Schools Found");
            schools([]);
          }else{

            schools(data);

          }
        }


        isProcessing(false);
      },
      onFailure: (errorMsg){
        dev.log("error message -> ${errorMsg}");
        isProcessing(false);
        Fluttertoast.showToast(
            msg: "Error in fethcing school details",
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