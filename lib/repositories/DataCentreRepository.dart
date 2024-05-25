
import 'dart:ffi';

import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCnewSchoolApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/apis/dc/DataCentreApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:retrofit/dio.dart';

class DataCentreRepository{
  final DataCentreApi api;
  final DCApiResponseNetworkMapper mapper;
  final DCnewSchoolApiResponseNetworkMapper mapper_newSchool;
  DataCentreRepository(this.api, this.mapper, this.mapper_newSchool);

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

  // void _handleDioValidateStat(Function(Int?) resp){
  //
  // }

  void authCallback(){}

}