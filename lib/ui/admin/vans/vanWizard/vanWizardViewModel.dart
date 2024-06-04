
import 'dart:ffi';

import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewVanApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCStdDetApiResponseDomainModel.dart';
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
  // RxString vehicleType = "".obs;
  Rx<VehicleTypes> vehicleType = VehicleTypes.BUS.obs;
  RxString driverName = "".obs;
  RxString driverNIC = "".obs;
  RxString driverContact = "".obs;
  // RxString studentsList = "".obs;
  RxList<SchoolDomainModel> schoolList = <SchoolDomainModel>[].obs;
  RxList<String> schoolDDList = <String>[].obs;
  Rx<String> schoolSelect = "".obs;
  RxInt schoolSelectIndex = 0.obs;

  //student list
  RxList<StudentsDomainModel> studentList = <StudentsDomainModel>[].obs;
  RxMap<String, bool> studentCheckMap = RxMap();

  // Rx<SchoolDomainModel?> schoolSelect = SchoolDomainModel(school_id: 1, admin_id: 1, school_name: "Select School", address: "0", contact_1: "0", is_active: 0, date_create: "0").obs;
  // Rx<SchoolDomainModel> schoolSelect = SchoolDomainModel(school_id: 0, admin_id: 0, school_name: "Select School", address: "0", contact_1: "0", is_active: 0, date_create: "0").obs;
  //RxInt schoolSelect;//SchoolDomainModel(school_id: 0, admin_id: 0, school_name: "Select School", address: "0", contact_1: "0", is_active: 0, date_create: "0").obs;

  handleVehicleRegNumChanges(String? updatedValue){
    vehicleRegNum(updatedValue);
  }
  handleVehicleTypeChanges(VehicleTypes updatedValue){
    vehicleType(updatedValue);
  }
  handleSchoolSelectedChanges(String updatedValue){
    schoolSelect(updatedValue);

    for(int i = 0; i<schoolDDList.length; i++){
      if(schoolDDList[i] == updatedValue){
        schoolSelectIndex(i);
        break;
      }
    }


  }
  // handleSchoolSelectedChanges(SchoolDomainModel? updatedValue){
  //   schoolSelect(updatedValue);
  // }
  // handleSchoolSelectedChanges(int? updatedValue){
  //   schoolSelect(updatedValue);
  // }
  handleDriverNameChanges(String? updatedValue){
    driverName(updatedValue);
  }
  handleDriverNICChanges(String? updatedValue){
    driverNIC(updatedValue);
  }

  handleDriverContactChanges(String? updatedValue){
    driverContact(updatedValue);
  }
  // handleStudentListChanges(String? updatedValue){
  //   studentsList(updatedValue);
  // }
  handleStudentListChanges(List<StudentsDomainModel>? updatedValue){
    studentList(updatedValue);
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
          // && studentsList!=null
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

        _submitNewVanForm();

      }

    }



  }

  void _submitNewVanForm()
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
        // schoolId: 0,
        // schoolId: schoolSelect.value!.school_id,
        schoolId: schoolSelectIndex.value,
    vehicleRegNum: vehicleRegNum.value,
    vehicleType: vehicleType.value.name,
    driverName: driverName.value,
    driverNIC: driverNIC.value,
    driverContact: driverContact.value,
    // students: studentsList.value
    students: ""
    );

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

  getSchools() async
  {

    isProcessing(true);

    int userId = await AppSession.currentUser.user_id() as int;

    dev.log("requestLogin; url -> ${ApiConst.BASE_URL}${ApiConst.URL_LOGIN}");
    dev.log("requestLogin; params -> {admin_id:${userId}}");

    repo.getSchoolDetails(userId,
        onSuccess: (response)
        // async
        {
          dev.log("on success -> ${response.success}");
          dev.log("response -> ${response.toJson()}");
          dev.log("response.data -> ${response.data!.toJson()}");
          dev.log("response.data.school -> ${response.data!.schools![0].toJson()}");

          var data = response.data;

          if(data == null){
            Fluttertoast.showToast(msg: "no Data Found");
            // schools!(null);
          }else{
            dev.log("adding to list");
            this.schoolList(data.schools);
            dev.log("starting to map in dd list");
            List<String> lst_schlName = schoolList.map((element) {
              dev.log("mapping -> ${element.school_name}");
                return element.school_name;
            }).toList();

            dev.log("mapping done -> ${lst_schlName}");
            this.schoolDDList(lst_schlName);
            dev.log("setting default selection");
            this.schoolSelect(lst_schlName[0]);
            dev.log("default selection done -> ${this.schoolSelect.value}");

            // if(data.isBlank){
            //   Fluttertoast.showToast(msg: "no Schools Found");
            //   schools([]);
            // }else{
            //
            //   schools(data);
            //
            // }
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
            this.studentList(null);
          }else{

            this.studentList(data.students);




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