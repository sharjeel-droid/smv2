
import 'dart:ffi';

import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewVanApiRequestDomainModel.dart';
import 'package:SMV2/repositories/DataCentreRepository.dart';
import 'package:SMV2/utils/AppSession.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


class VanWizardViewModel extends GetxController{
  final DataCentreRepository repo;
  VanWizardViewModel(this.repo);

  //non-observables
  final _context = Get.find<BuildContext>();
  //--//
  final _formKey_add_van = GlobalKey<FormState>();
  addVanFormKey(){return _formKey_add_van;}

  //observables
  RxBool isProcessing = false.obs;

  RxString vehicleRegNum = "".obs;
  RxString vehicleType = "".obs;
  RxInt schoolSelect = 0.obs;
  RxString driverName = "".obs;
  RxString driverNIC = "".obs;
  RxString driverContact = "".obs;
  RxString studentsList = "".obs;

  handleVehicleRegNumChanges(String? updatedValue){
    vehicleRegNum(updatedValue);
  }
  handleVehicleTypeChanges(String? updatedValue){
    vehicleType(updatedValue);
  }
  handleSchoolSelectedChanges(int? updatedValue){
    schoolSelect(updatedValue);
  }
  handleDriverNameChanges(String? updatedValue){
    driverName(updatedValue);
  }
  handleDriverNICChanges(String? updatedValue){
    driverNIC(updatedValue);
  }

  handleDriverContactChanges(String? updatedValue){
    driverContact(updatedValue);
  }
  handleStudentListChanges(String? updatedValue){
    studentsList(updatedValue);
  }

  checkSubmission() {


    final FormState? _form = _formKey_add_van.currentState;

    if(_form !. validate())
    {
      if(vehicleRegNum!=null
          && vehicleType!=null
          && schoolSelect!=null
          && driverName!=null
          && driverNIC!=null
          && driverContact!=null
          && studentsList!=null
      ){
        isProcessing(true);

        dev.log("started");

        _form.save();
        // dev.log("schoolName -> ${studentName}"
        //     ", schoolAddress -> ${schoolAddress}"
        //     ", schoolContact -> ${schoolContact}"
        //     ", supervisorName -> ${supervisorName}"
        //     ", supervisorNIC -> ${supervisorNIC}"
        //     ", supervisorEmail -> ${supervisorEmail}"
        //     ", supervisorAddress -> ${supervisorAddress}"
        //     ", supervisorContact -> ${supervisorContact}"
        // );

        submitNewVanForm();

      }

    }



  }

  void submitNewVanForm()
  async
  {

    // dev.log("submitNewStudentForm; url -> ${ApiConst.BASE_URL}${ApiConst.URL_SCHOOL_NEW_FOR_ADMINS}");


    int? adminId = await AppSession.currentUser.user_id();

    if(adminId == null) {
      dev.log("adminId is null");
      Fluttertoast.showToast(msg: "something wrong! try again");
      return;
    }

    DCNewVanApiRequestDomainModel newVanDetails = DCNewVanApiRequestDomainModel(
        adminId: adminId,
        schoolId: schoolSelect.value,
    vehicleRegNum: vehicleRegNum.value,
    vehicleType: vehicleType.value,
    driverName: driverName.value,
    driverNIC: driverNIC.value,
    driverContact: driverContact.value,
    students: studentsList.value);

    dev.log("submitNewVanForm; params -> ${newVanDetails.toJson()}");

    repo.newVan(
      newVanDetails,
        onSuccess: (response)
        async
        {
          dev.log("on success -> ${response.success}");
          // dev.log("on success user's name -> ${response.data?[0].bio.first_name}");

          // var data = response.data?[0];

          // if(data!=null){
          //   dev.log("data found.");
          //   //putting in session
          //
          //   // Get.find<AppSession>()
          //
          //   await AppSession
          //       .currentUser
          //       .handleCurrentUserData(
          //       access_id: data.access_id,
          //       label_id: data.label_id,
          //       user_id: data.user_id,
          //       login_id: data.login_id,
          //       token_id: data.token_id,
          //       admin_id: data.bio.admin_id ?? 0,
          //       s_admin_id: data.bio.s_admin_id ?? 0,
          //       school_id: data.bio.school_id ?? 0,
          //       first_name: data.bio.first_name,
          //       last_name: data.bio.last_name,
          //       gender: data.bio.gender,
          //       nic_number: data.bio.nic_number,
          //       email: data.bio.email,
          //       contact1: data.bio.contact_1,
          //       contact2: data.bio.contact_2,
          //       address: data.bio.address,
          //       pic: data.bio.pic,
          //       longitude: data.bio.loc_users?.longitude,
          //       latitude: data.bio.loc_users?.latitude
          //   );
          //
          //   dev.log('session added');
          //
          //   navigate().toHome(/*context: _context*/);
          //
          //
          //
          // }


          isProcessing(false);
          navigate().back();
        },
        onFailure: (errorMsg){
          dev.log("error message -> ${errorMsg}");
          isProcessing(false);
          Fluttertoast.showToast(
              msg: "unable to add new student",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        );


  }


}