import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/dataConstants.dart';
import 'package:SMV2/domain/models/dc/DCNewSchoolApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewStdApiRequestDomainModel.dart';
import 'package:SMV2/domain/models/dc/DCNewVanApiRequestDomainModel.dart';
import 'package:SMV2/network/entities/ApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/LoginApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCDriverDashApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCStdDetApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCVanDetApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewSchoolApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewVanApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DataCentreApiResponseNetworkEntity.dart';
import 'package:SMV2/network/entities/dc/DCnewStdApiResponseNetworkEntity.dart';
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
  Future<HttpResponse<DCnewSchoolApiResponseNetworkEntity>> schoolNewForAdmins(
      @Body(nullToAbsent: false) DCNewSchoolApiRequestDomainModel SchoolDetails
      );

  @GET(ApiConst.URL_STUDENT_DETS_FOR_ADMINS)
  Future<HttpResponse<DCStdDetApiResponseNetworkEntity>> studentDetailsForAdmins(
      @Query(dataKeys.ADMIN_ID) int admin_id
      );

  @POST(ApiConst.URL_STUDENT_NEW_FOR_ADMINS)
  Future<HttpResponse<DCnewStdApiResponseNetworkEntity>> studentNewForAdmins(
      @Body(nullToAbsent: false) DCNewStdApiRequestDomainModel StudentDetails
      );

  @GET(ApiConst.URL_VANS_DETS_FOR_ADMINS)
  Future<HttpResponse<DCVanDetApiResponseNetworkEntity>> vanDetailsForAdmins(
      @Query(dataKeys.ADMIN_ID) int admin_id
      );

  @POST(ApiConst.URL_VANS_NEW_FOR_ADMINS)
  Future<HttpResponse<DCnewVanApiResponseNetworkEntity>> vanNewForAdmins(
      @Body(nullToAbsent: false) DCNewVanApiRequestDomainModel VanDetails
      );


  @GET(ApiConst.URL_DASH_DET_FOR_DRIVER)
  Future<HttpResponse<DCDriverDashApiResponseNetworkEntity>> dashboardDetailsForDriver(
      @Query(dataKeys.DRIVER_ID) int driver_id
      );

  @POST(ApiConst.URL_NEW_TRIP_BY_DRIVER)
  @FormUrlEncoded()
  Future<HttpResponse<ApiResponseNetworkEntity>> newTripByDriver(
      @Field(dataKeys.ROUTE_ID) int route_id,
      @Field(dataKeys.TIME_START) String time_start,
      @Field(dataKeys.TRIP_COURSE) String trip_course
      );

  @GET(ApiConst.URL_TRIP_ACTIVE_FOR_DRIVER)
  // Future<HttpResponse<DCDriverDashApiResponseNetworkEntity>> activeTripsForDriver(
  Future<HttpResponse<ApiResponseNetworkEntity>> activeTripsForDriver(
      @Query(dataKeys.DRIVER_ID) int driver_id
      );


  @POST(ApiConst.URL_UPD_STUDENT_TRIP_STATUS)
  @FormUrlEncoded()
  Future<HttpResponse<ApiResponseNetworkEntity>> updateStudentTripStatus(
      @Field(dataKeys.TRIP_ID) int trip_id,
      @Field(dataKeys.STUDENT_ID) int student_id,
      @Field(dataKeys.STATUS) String status,
      // @Path(dataKeys.REASON) String? reason,
      );

  @POST(ApiConst.URL_FINISH_TRIP)
  @FormUrlEncoded()
  Future<HttpResponse<ApiResponseNetworkEntity>> finishTrip(
      @Field(dataKeys.TIME_END) String time_end,
      @Field(dataKeys.TRIP_ID) int trip_id
      );

  @GET(ApiConst.URL_TRIP_ACTIVE_FOR_PARENT)
  Future<HttpResponse<ApiResponseNetworkEntity>> activeTripsForParent(
      @Query(dataKeys.PARENT_ID) int parent_id
      );


  @GET(ApiConst.URL_DASH_SUMM_FOR_PARENT)
  Future<HttpResponse<ApiResponseNetworkEntity>> dashboardSummaryForParent(
      @Query(dataKeys.PARENT_ID) int parent_id
      );

}