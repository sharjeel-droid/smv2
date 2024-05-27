import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DCStdDetApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;


class AdminStudentsViewModel extends GetxController{
  final DataCentreRepository repo;
  AdminStudentsViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//

  //observables
  RxBool isProcessing = false.obs;
  RxList<StudentsDomainModel> students = RxList<StudentsDomainModel>();


getStudents() async
{

  isProcessing(true);

int userId = await AppSession.currentUser.user_id() as int;

  dev.log("requestLogin; url -> ${ApiConst.BASE_URL}${ApiConst.URL_STUDENT_DETS_FOR_ADMINS}");

  repo.getStudentDetails(userId,
      onSuccess: (response)
      // async
      {
        dev.log("on success -> ${response.success}");
        dev.log("on message -> ${response.message}");

        var data = response.data;

        if(data == null){
          Fluttertoast.showToast(msg: "no Data Found");
          students!(null);
        }else{

          students!(data.students);
        }


        isProcessing(false);
      },
      onFailure: (errorMsg){
        dev.log("error message -> ${errorMsg}");
        isProcessing(false);
        Fluttertoast.showToast(
            msg: "Error in fethcing student details",
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