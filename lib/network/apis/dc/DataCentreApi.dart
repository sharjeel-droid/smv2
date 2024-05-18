import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/dataConstants.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'DataCentreApi.g.dart';

@RestApi(baseUrl: ApiConst.BASE_URL)
abstract class DataCentreApi{
  factory DataCentreApi(Dio dio, {String baseUrl}) = _DataCentreApi;



  @GET(ApiConst.URL_SCHOOL_DETS_FOR_ADMINS)
  Future<HttpResponse<DataCentreApiResponseNetworkEntity>> schoolDetailsForAdmins(
      @Query(dataKeys.ADMIN_ID) int admin_id
      );

  @POST(ApiConst.URL_SCHOOL_NEW_FOR_ADMINS)
  Future<HttpResponse<DataCentreApiResponseNetworkEntity>> schoolNewForAdmins(
      @Body(nullToAbsent: false) DCNewSchoolApiRequestDomainModel SchoolDetails
      );

}