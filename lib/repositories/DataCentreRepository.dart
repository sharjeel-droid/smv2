
import 'dart:ffi';

import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DataCentreApiResponseDomainModel.dart';
import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/apis/dc/DataCentreApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DCApiResponseNetworkMapper.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:retrofit/dio.dart';

class DataCentreRepository{
  final DataCentreApi api;
  final DCApiResponseNetworkMapper mapper;
  DataCentreRepository(this.api, this.mapper);

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
      dev.log("onFailure -> ${e.toString()}");
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
      // dev.log("error -> ${e.toString()}");
      onFailure!(e.toString());

    }


    // if(!resp.isEmpty){}

    // return resp;

  }

  newSchool(DCNewSchoolApiRequestDomainModel newSchoolDetails,
      {Function(DataCentreApiResponseDomainModel response)? onSuccess,
        Function(String? errorMessage)? onFailure}
      )
  async
  {

    try{

      dev.log("request parameter -> schoolDetails : ${newSchoolDetails.toJson()}");

      HttpResponse<DataCentreApiResponseNetworkEntity> httpResponse = await api.schoolNewForAdmins(newSchoolDetails);
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
      dev.log("onFailure -> ${e.toString()}");
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
      // dev.log("error -> ${e.toString()}");
      onFailure!(e.toString());

    }


    // if(!resp.isEmpty){}

    // return resp;

  }

  // void _handleDioValidateStat(Function(Int?) resp){
  //
  // }

  void authCallback(){}

}