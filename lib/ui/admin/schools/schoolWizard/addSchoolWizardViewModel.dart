import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;


class AddSchoolWizardViewModel extends GetxController{
  final DataCentreRepository repo;
  AddSchoolWizardViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//
  final _formKey_add_school = GlobalKey<FormState>();
  addSchoolFormKey(){return _formKey_add_school;}

  //observables
  RxBool isProcessing = false.obs;
  RxString schoolName = "".obs;

  handleSchoolNameChanges(String? updatedValue){
    schoolName(updatedValue);
  }

  // RxList<SchoolDomainModel> schools = RxList<SchoolDomainModel>();

//
// getSchools() async
// {
//
//   isProcessing(true);
//
//   // schools(["asd", "123", "523"]);
//
// int userId = await AppSession.currentUser.user_id() as int;
// // int userId = 1;
//
//
//   dev.log("requestLogin; url -> ${ApiConst.BASE_URL}${ApiConst.URL_LOGIN}");
//   dev.log("requestLogin; params -> {admin_id:${userId}}");
//
//   repo.getSchoolDetails(userId,
//       onSuccess: (response)
//       // async
//       {
//         dev.log("on success -> ${response.success}");
//         dev.log("response -> ${response.toJson()}");
//         dev.log("response.data -> ${response.data!.toJson()}");
//         dev.log("response.data.school -> ${response.data!.schools![0].toJson()}");
//
//         var data = response.data;
//
//         if(data == null){
//           Fluttertoast.showToast(msg: "no Data Found");
//           schools!(null);
//         }else{
//
//           schools!(data.schools);
//
//           // if(data.isBlank){
//           //   Fluttertoast.showToast(msg: "no Schools Found");
//           //   schools([]);
//           // }else{
//           //
//           //   schools(data);
//           //
//           // }
//         }
//
//
//         isProcessing(false);
//       },
//       onFailure: (errorMsg){
//         dev.log("error message -> ${errorMsg}");
//         isProcessing(false);
//         Fluttertoast.showToast(
//             msg: "Error in fethcing school details",
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 2,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0
//         );
//       });
//
//
//
//
//
//
// }



}