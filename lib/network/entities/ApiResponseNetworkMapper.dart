import 'package:SMV2/network/entities/ApiResponseNetworkEntity.dart';
import 'package:SMV2/utils/EntityMapper.dart';

import '../../domain/models/ApiResponseDomainModel.dart';

class ApiResponseNetworkMapper implements EntityMapper<ApiResponseNetworkEntity, ApiResponseDomainModel>{
  @override
  ApiResponseDomainModel mapFromEntity(ApiResponseNetworkEntity entity) {

    return ApiResponseDomainModel(success: entity.success, message: entity.message,
        data: entity.data

        // entity.data?.map((e) => DataDomainModel(access_id: e.access_id, label_id: e.label_id, user_id: e.user_id,
        //     login_id: e.login_id, pass: e.pass, date_create: e.date_create, is_active: e.is_active, is_loggedin: e.is_loggedin,
        //     token_id: e.token_id??"0",
        //     bio:
        //
        //     BIODomainModel(user_id: e.bio.user_id, admin_id: e.bio.admin_id,
        //         school_id: e.bio.school_id, first_name: e.bio.first_name, last_name: e.bio.last_name,
        //         gender: e.bio.gender, nic_number: e.bio.nic_number, email: e.bio.email,
        //         contact_1: e.bio.contact_1, address: e.bio.address, pic: e.bio.pic,
        //         is_active: e.bio.is_active, date_create: e.bio.date_create,
        //         contact_2: e.bio.contact_2, date_update: e.bio.date_update,
        //         loc_users:
        //         LOCUsersDomainModel(loc_user_id: e.bio.loc_users!.loc_user_id, user_id: e.bio.loc_users!.user_id,
        //             label_id: e.bio.loc_users!.label_id, longitude: e.bio.loc_users!.longitude,
        //             latitude: e.bio.loc_users!.latitude, date_create: e.bio.loc_users!.date_create)
        //
        //     )
        //
        // )).toList()

        );
  }

  @override
  ApiResponseNetworkEntity mapToEntity(ApiResponseDomainModel domain) {

    // return ApiResponseNetworkEntity(success: domain.success);
    return ApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data: domain.data

        // domain.data?.map((d) => DataNetworkEntity(access_id: d.access_id, label_id: d.label_id, user_id: d.user_id,
        //     login_id: d.login_id, pass: d.pass, date_create: d.date_create, is_active: d.is_active, is_loggedin: d.is_loggedin,
        //     token_id: d.token_id,
        //     bio:
        //
        //     BIONetworkEntity(user_id: d.bio.user_id, admin_id: d.bio.admin_id,
        //         school_id: d.bio.school_id, first_name: d.bio.first_name, last_name: d.bio.last_name,
        //         gender: d.bio.gender, nic_number: d.bio.nic_number, email: d.bio.email,
        //         contact_1: d.bio.contact_1, address: d.bio.address, pic: d.bio.pic,
        //         is_active: d.bio.is_active, date_create: d.bio.date_create,
        //         contact_2: d.bio.contact_2, date_update: d.bio.date_update,
        //         loc_users:
        //         LOCUsersNetworkEntity(loc_user_id: d.bio.loc_users!.loc_user_id, user_id: d.bio.loc_users!.user_id,
        //             label_id: d.bio.loc_users!.label_id, longitude: d.bio.loc_users!.longitude,
        //             latitude: d.bio.loc_users!.latitude, date_create: d.bio.loc_users!.date_create)
        //
        //     )
        //
        // )).toList()

    );
  }

}