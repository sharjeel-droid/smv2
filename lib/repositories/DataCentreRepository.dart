

import 'package:SMV2/constants/dataConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/domain/models/ApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverActiveTripsDataDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewVanApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCVanDetApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCnewSchoolApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCnewStdApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCnewVanApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/apis/dc/DataCentreApi.dart';
import 'package:SMV2/network/entities/ApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/ApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCStdDetApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCStdDetApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCVanDetApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCVanDetApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCnewVanApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewVanApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:retrofit/dio.dart';

import '../domain/models/dc/DCStdDetApiResponseDomainModel.dart';
import '../network/entities/dc/DCnewSchoolApiResponseNetworkMapper.dart';

class DataCentreRepository{
  final DataCentreApi api;
  final ApiResponseNetworkMapper mapper_base;
  final DCApiResponseNetworkMapper mapper;
  final DCnewSchoolApiResponseNetworkMapper mapper_newSchool;
  final DCStdDetApiResponseNetworkMapper mapper_students;
  final DCnewStdApiResponseNetworkMapper mapper_newStudents;
  final DCVanDetApiResponseNetworkMapper mapper_van;
  final DCnewVanApiResponseNetworkMapper mapper_newVan;
  final DCDriverDashApiResponseNetworkMapper mapper_driverDash;
  DataCentreRepository(this.api, this.mapper_base, this.mapper,
      this.mapper_newSchool, this.mapper_students,
      this.mapper_newStudents, this.mapper_van, this.mapper_newVan,
      this.mapper_driverDash);

  static const _TAG = "DataCentreRepository.dart";
  // AuthApi _authApi = AuthApi(Dio(BaseOptions(contentType: 'application/json')));


  // Future<LoginApiResponseDomainModel> checkLogin(String username, String password)
  getSchoolDetails(int admin_id, {Function(DataCentreApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> admin_id : ${admin_id}");

      HttpResponse<DataCentreApiResponseNetworkEntity> httpResponse = await api.schoolDetailsForAdmins(admin_id);
      dev.log("response code -> ${httpResponse.response.statusCode}");
      // dev.log('{AuthRepo -> headers:${httpResponse.response.headers}; code:${httpResponse.response.statusCode};'
      //     'message:${httpResponse.response.statusMessage} }');
      // var opt = httpResponse.response.requestOptions;
      // dev.log('Auth repo req options -> { baseurl:${opt.baseUrl}; method:${opt.method} }');



      // dev.log('AuthRepo->CheckLogin; response request options -> ${}');

      var resp = httpResponse.data;


      if(resp.success == 1){
        if(resp!=null){
          onSuccess!(mapper.mapFromEntity(resp));
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");
      // onFailure!(e.toString());

      // _handleDioValidateStat((p0) => e.requestOptions.validateStatus);
      // e.requestOptions.validateStatus;


      // dev.log('Auth Repo dio exception -> {code:${e.response?.statusCode??"00"}; '
      //     'message:${e.response?.statusMessage??"~"}; '
      //     'request url :${e.requestOptions.baseUrl}${e.requestOptions.path}; '
      //     'method:${e.requestOptions.method}; '
      //     'headers:${e.requestOptions.headers}; '
      //     'params:${e.requestOptions.queryParameters}; '
      //     // 'baseUrl:${e.requestOptions.baseUrl}; '
      //     'validateStatus:${e.requestOptions.validateStatus} ');
    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      onFailure!(e.toString());

    }


    // if(!resp.isEmpty){}

    // return resp;

  }

  newSchool(DCNewSchoolApiRequestDomainModel newSchoolDetails,
      {Function(DCnewSchoolApiResponseDomainModel response)? onSuccess,
        Function(String? errorMessage)? onFailure}
      )
  async
  {

    try{

      dev.log("request parameter -> schoolDetails : ${newSchoolDetails.toJson()}");

      HttpResponse<DCnewSchoolApiResponseNetworkEntity> httpResponse = await api.schoolNewForAdmins(newSchoolDetails);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      switch(httpResponse.response.statusCode){

        case 200 : {

          var response = httpResponse.data;


          if(response.success == 1){
            if(response!=null){

              dev.log("response not null");
              onSuccess!(mapper_newSchool.mapFromEntity(response));

            }else{
              dev.log("response null");
              onFailure!("Empty response");
            }

          }else{
            dev.log("un successfull");
            onFailure!("request un-succcessful");
          }

          break;
        }

        case 400 : {
          dev.log("error response");
          onFailure!("400; "+ ("${httpResponse.response.statusMessage??"unknown error"}"));
          break;
        }

        default : {
          dev.log("def; unknown response -> ${httpResponse.data.message}");
          break;
        }


      }





      // dev.log('AuthRepo->CheckLogin; response request options -> ${}');

      // var resp = httpResponse.data;
      //
      //
      // if(resp.success == 1){
      //   if(resp!=null){
      //     onSuccess!(mapper.mapFromEntity(resp));
      //   }
      //
      // }else{
      //   onFailure!("request un-succcessful");
      // }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.toString()}");
      onFailure!("DIO Exc; " + ("${e.response?.statusMessage??"unknown error"}"));
      // onFailure!(e.toString());

      // _handleDioValidateStat((p0) => e.requestOptions.validateStatus);
      // e.requestOptions.validateStatus;


      // dev.log('Auth Repo dio exception -> {code:${e.response?.statusCode??"00"}; '
      //     'message:${e.response?.statusMessage??"~"}; '
      //     'request url :${e.requestOptions.baseUrl}${e.requestOptions.path}; '
      //     'method:${e.requestOptions.method}; '
      //     'headers:${e.requestOptions.headers}; '
      //     'params:${e.requestOptions.queryParameters}; '
      //     // 'baseUrl:${e.requestOptions.baseUrl}; '
      //     'validateStatus:${e.requestOptions.validateStatus} ');
    }
    catch(e){
      // e as DioException;
      // dev.log("error -> ${e.toString()}");
      onFailure!("exc; "+(e.toString()));

    }


    // if(!resp.isEmpty){}

    // return resp;

  }


  getStudentDetails(int admin_id, {Function(DCStdDetApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> admin_id : ${admin_id}");

      HttpResponse<DCStdDetApiResponseNetworkEntity> httpResponse = await api.studentDetailsForAdmins(admin_id);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      var resp = httpResponse.data;

      if(resp.success == 1){
        if(resp!=null){
          onSuccess!(this.mapper_students.mapFromEntity(resp));
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");

    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      onFailure!(e.toString());

    }

  }


  newStudent(DCNewStdApiRequestDomainModel newStdDetails,
      {Function(DCnewStdApiResponseDomainModel response)? onSuccess,
        Function(String? errorMessage)? onFailure}
      )
  async
  {

    try{

      dev.log("request parameter -> studentDetails : ${newStdDetails.toJson()}");

      HttpResponse<DCnewStdApiResponseNetworkEntity> httpResponse = await api.studentNewForAdmins(newStdDetails);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      switch(httpResponse.response.statusCode){

        case 200 : {

          var response = httpResponse.data;


          if(response.success == 1){
            if(response!=null){

              dev.log("response not null");
              onSuccess!(this.mapper_newStudents.mapFromEntity(response));

            }else{
              dev.log("response null");
              onFailure!("Empty response");
            }

          }else{
            dev.log("un successfull");
            onFailure!("request un-succcessful");
          }

          break;
        }

        case 400 : {
          dev.log("error response");
          onFailure!("400; "+ ("${httpResponse.response.statusMessage??"unknown error"}"));
          break;
        }

        default : {
          dev.log("def; unknown response -> ${httpResponse.data.message}");
          break;
        }


      }


    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.toString()}");
      onFailure!("DIO Exc; " + ("${e.response?.statusMessage??"unknown error"}"));

    }
    catch(e){
      onFailure!("exc; "+(e.toString()));

    }


    // if(!resp.isEmpty){}

    // return resp;

  }


  getVanDetails(int admin_id, {Function(DCVanDetApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> admin_id : ${admin_id}");

      HttpResponse<DCVanDetApiResponseNetworkEntity> httpResponse = await api.vanDetailsForAdmins(admin_id);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      var resp = httpResponse.data;

      if(resp.success == 1){
        if(resp!=null){
          onSuccess!(this.mapper_van.mapFromEntity(resp));
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");

    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      // dev.log("error stack-> ${e}");
      onFailure!(e.toString());

    }

  }

  newVan(DCNewVanApiRequestDomainModel newVanDetails,
      {Function(DCnewVanApiResponseDomainModel response)? onSuccess,
        Function(String? errorMessage)? onFailure}
      )
  async
  {

    try{

      dev.log("request parameter -> vanDetails : ${newVanDetails.toJson()}");

      HttpResponse<DCnewVanApiResponseNetworkEntity> httpResponse = await api.vanNewForAdmins(newVanDetails);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      switch(httpResponse.response.statusCode){

        case 200 : {

          var response = httpResponse.data;


          if(response.success == 1){
            if(response!=null){

              dev.log("response not null");
              onSuccess!(this.mapper_newVan.mapFromEntity(response));

            }else{
              dev.log("response null");
              onFailure!("Empty response");
            }

          }else{
            dev.log("un successfull");
            onFailure!("request un-succcessful");
          }

          break;
        }

        case 400 : {
          dev.log("error response");
          onFailure!("400; "+ ("${httpResponse.response.statusMessage??"unknown error"}"));
          break;
        }

        default : {
          dev.log("def; unknown response -> ${httpResponse.data.message}");
          break;
        }


      }


    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.toString()}");
      dev.log("onFailure trace-> ${e.stackTrace}");
      // dev.log("onFailure stat code-> ${e.response?.statusCode}");
      // dev.log("onFailure stat data-> ${(e.response?.data as Map<String, dynamic>)["message"]}");
      onFailure!("DIO Exc; " + ("${e.response?.statusMessage??"unknown error"}"));

    }
    catch(e){
      onFailure!("exc; "+(e.toString()));

    }


    // if(!resp.isEmpty){}

    // return resp;

  }

  getDriverDashboardDetails(int driver_id, {Function(DCDriverDashApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> driver_id : ${driver_id}");

      HttpResponse<DCDriverDashApiResponseNetworkEntity> httpResponse = await api.dashboardDetailsForDriver(driver_id);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      var resp = httpResponse.data;
      dev.log("data.success -> ${resp.success}");
      if(resp.success == 1){
        if(resp!=null){
          onSuccess!(this.mapper_driverDash.mapFromEntity(resp));
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");

    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      // dev.log("error stack-> ${e}");
      onFailure!(e.toString());

    }

  }

  getDriverActiveTrips(int driver_id, {Function(DcDriverActiveTripsDataDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> driver_id : ${driver_id}");

      HttpResponse<ApiResponseNetworkEntity> httpResponse = await api.activeTripsForDriver(driver_id);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      var resp = httpResponse.data;

      if(resp.success == 1){
        if(resp!=null){

          // var dt = this.mapper_base.mapFromEntity(resp).data as DcDriverActiveTripsDataDomainModel;
          var dt = DcDriverActiveTripsDataDomainModel.fromJson(this.mapper_base.mapFromEntity(resp).data);
          dt = _updateStudentCounts(dt);

          onSuccess!(dt);

          // onSuccess!(this.mapper_base.mapFromEntity(resp) as DcDriverActiveTripsDataDomainModel);
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");

    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      // dev.log("error stack-> ${e}");
      onFailure!(e.toString());

    }

  }

  updateStudentTripStatus(int trip_id, int student_id, String status, String? reason, {Function(ApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      dev.log("request parameter -> trip_id : ${trip_id}");
      dev.log("request parameter -> student_id : ${student_id}");
      dev.log("request parameter -> status : ${status}");
      dev.log("request parameter -> reason : ${reason}");

      HttpResponse<ApiResponseNetworkEntity> httpResponse = await api.updateStudentTripStatus(trip_id, student_id, status, reason);
      dev.log("response code -> ${httpResponse.response.statusCode}");

      var resp = httpResponse.data;

      if(resp.success == 1){
        if(resp!=null){
          onSuccess!(this.mapper_base.mapFromEntity(resp));
        }

      }else{
        onFailure!("request un-succcessful");
      }

    }
    on DioException catch(e){
      dev.log("onFailure -> ${e.message}");
      dev.log("onFailure -> ${e.stackTrace}");
      onFailure!("${e.response?.statusMessage??"unknown error"}");

    }
    catch(e){
      // e as DioException;
      dev.log("error -> ${e.toString()}");
      // dev.log("error stack-> ${e}");
      onFailure!(e.toString());

    }

  }

  DcDriverActiveTripsDataDomainModel _updateStudentCounts(DcDriverActiveTripsDataDomainModel dt){

    var updatedData = dt;

    if(dt.trip!.students != null){

      updatedData.trip!.count_total = dt.trip!.students!.length;

      for(final std in dt.trip!.students!!){

        if(std.status == StudentTripStatus.PICKED_UP){
          updatedData.trip!.count_picked += 1;
        }

        if(std.status == StudentTripStatus.ABSENT){
          updatedData.trip!.count_absent += 1;
        }

        if(std.status == StudentTripStatus.WAITING || std.status == StudentTripStatus.NEXT){
          updatedData.trip!.count_remaining += 1;
        }

      }

      // updatedData.trip!.count_remaining =
    }

    dev.log("updated student counts -> ///////////////////////////");
    dev.log("total -> ${updatedData.trip!.count_total}");
    dev.log("picked -> ${updatedData.trip!.count_picked}");
    dev.log("absent -> ${updatedData.trip!.count_absent}");
    dev.log("remaining -> ${updatedData.trip!.count_remaining}");
    dev.log("updated student counts -> ---------------------------");

    return updatedData;


  }

  void authCallback(){}

}