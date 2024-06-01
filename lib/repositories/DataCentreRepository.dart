

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
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
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
  final DCApiResponseNetworkMapper mapper;
  final DCnewSchoolApiResponseNetworkMapper mapper_newSchool;
  final DCStdDetApiResponseNetworkMapper mapper_students;
  final DCnewStdApiResponseNetworkMapper mapper_newStudents;
  final DCVanDetApiResponseNetworkMapper mapper_van;
  final DCnewVanApiResponseNetworkMapper mapper_newVan;
  DataCentreRepository(this.api, this.mapper,
      this.mapper_newSchool, this.mapper_students,
      this.mapper_newStudents, this.mapper_van, this.mapper_newVan);

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


  // void _handleDioValidateStat(Function(Int?) resp){
  //
  // }

  void authCallback(){}

}