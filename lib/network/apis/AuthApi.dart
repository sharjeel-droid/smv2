import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/dataConstants.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'AuthApi.g.dart';

@RestApi(baseUrl: ApiConst.BASE_URL)
abstract class AuthApi{
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;



  @GET(ApiConst.URL_LOGIN)
  Future<HttpResponse<LoginApiResponseNetworkEntity>> checkLogin(
      @Query(dataKeys.LOGIN_ID) String username,
      @Query(dataKeys.PASSWORD) String password
      );

}