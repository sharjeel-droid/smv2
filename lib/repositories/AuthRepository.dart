import 'dart:ffi';

import 'package:SMV2/domain/models/auth/login/LoginApiResponseDomainModel.dart';
import 'package:SMV2/network/apis/AuthApi.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkMapper.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:retrofit/dio.dart';

class AuthRepository{
  final AuthApi api;
  final LoginApiResponseNetworkMapper mapper;
  AuthRepository(this.api, this.mapper);

  static const _TAG = "AuthRepository.dart";
  // AuthApi _authApi = AuthApi(Dio(BaseOptions(contentType: 'application/json')));


  // Future<LoginApiResponseDomainModel> checkLogin(String username, String password)
  checkLogin(String username, String password, {Function(LoginApiResponseDomainModel response)? onSuccess, Function(String? errorMessage)? onFailure})
  async
  {

    try{

      // LoginApiResponseNetworkEntity resp = await api.checkLogin(username, password);
      HttpResponse<LoginApiResponseNetworkEntity> httpResponse = await api.checkLogin(username, password);

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