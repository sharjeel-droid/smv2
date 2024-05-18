import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
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
  RxString schoolAddress = "".obs;
  RxString schoolContact = "".obs;
  RxString supervisorName = "".obs;
  RxString supervisorNIC = "".obs;
  RxString supervisorEmail = "".obs;
  RxString supervisorAddress = "".obs;
  RxString supervisorContact = "".obs;

  handleSchoolNameChanges(String? updatedValue){
    schoolName(updatedValue);
  }
  handleSchoolAddressChanges(String? updatedValue){
    schoolAddress(updatedValue);
  }
  handleSchoolContactChanges(String? updatedValue){
    schoolContact(updatedValue);
  }

  handleSupervisorNameChanges(String? updatedValue){
    supervisorName(updatedValue);
  }
  handleSupervisorNICChanges(String? updatedValue){
    supervisorNIC(updatedValue);
  }
  handleSupervisorEmailChanges(String? updatedValue){
    supervisorEmail(updatedValue);
  }
  handleSupervisorAddressChanges(String? updatedValue){
    supervisorAddress(updatedValue);
  }
  handleSupervisorContactChanges(String? updatedValue){
    supervisorContact(updatedValue);
  }

  checkSubmission() {


    final FormState? _form = _formKey_add_school.currentState;

    if(_form !. validate())
    {
      if(schoolName!=null
          && schoolAddress!=null
          && schoolContact!=null
          && supervisorName!=null
          && supervisorNIC!=null
          && supervisorEmail!=null
          && supervisorAddress!=null
          && supervisorContact!=null
      ){
        isProcessing(true);

        dev.log("started");

        _form.save();
        dev.log("schoolName -> ${schoolName}"
            ", schoolAddress -> ${schoolAddress}"
            ", schoolContact -> ${schoolContact}"
            ", supervisorName -> ${supervisorName}"
            ", supervisorNIC -> ${supervisorNIC}"
            ", supervisorEmail -> ${supervisorEmail}"
            ", supervisorAddress -> ${supervisorAddress}"
            ", supervisorContact -> ${supervisorContact}"
        );

        submitNewSchoolForm();

      }

    }



  }

  void submitNewSchoolForm() {

    dev.log("submitNewSchoolForm; url -> ${ApiConst.BASE_URL}${ApiConst.URL_LOGIN}");

    DCNewSchoolApiRequestDomainModel newSchoolDetails = DCNewSchoolApiRequestDomainModel(
        schoolName: schoolName.value,
        schoolAddress: schoolAddress.value,
        schoolContact: schoolContact.value,
        supervisorName: supervisorName.value,
        supervisorNIC: supervisorNIC.value,
        supervisorEmail: supervisorEmail.value,
        supervisorAddress: supervisorAddress.value,
        supervisorContact: supervisorContact.value);

    dev.log("submitNewSchoolForm; params -> ${newSchoolDetails.toJson()}");
    //
    // dev.log("submitNewSchoolForm; params -> {"
    //     "schoolName:${schoolName.value},"
    //     " schoolAddress:${schoolAddress.value}"
    //     " schoolContact:${schoolContact.value}"
    //     " supervisorName:${supervisorName.value}"
    //     " supervisorNIC:${supervisorNIC.value}"
    //     " supervisorEmail:${supervisorEmail.value}"
    //     " supervisorAddress:${supervisorAddress.value}"
    //     " supervisorContact:${supervisorContact.value}"
    //     "}");

    repo.newSchool(
      newSchoolDetails,
        // schoolName.value as int,
        // password.value.toMD5(),
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
        },
        onFailure: (errorMsg){
          dev.log("error message -> ${errorMsg}");
          isProcessing(false);
          Fluttertoast.showToast(
              msg: "unable to add new school",
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