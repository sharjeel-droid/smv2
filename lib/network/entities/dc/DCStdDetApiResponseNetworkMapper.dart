import 'package:SMV2/utils/EntityMapper.dart';

import '../../../domain/models/dc/DCStdDetApiResponseDomainModel.dart';
import 'DCStdDetApiResponseNetworkEntity.dart';

class DCStdDetApiResponseNetworkMapper implements EntityMapper<DCStdDetApiResponseNetworkEntity, DCStdDetApiResponseDomainModel>{
  @override
  DCStdDetApiResponseDomainModel mapFromEntity(DCStdDetApiResponseNetworkEntity entity) {

    return DCStdDetApiResponseDomainModel(success: entity.success, message: entity.message,
        data: DcStudentsDataDomainModel(
            students:
            entity.data?.students?.map((e) =>
                StudentsDomainModel(student_id: e.student_id, admin_id : e.admin_id,school_id: e.school_id, father_id: e.father_id, mother_id: e.mother_id,
                    gender:e.gender, first_name:e.first_name, last_name:e.last_name, pic:e.pic, is_active: e.is_active,
                    date_create: e.date_create, date_update: e.date_update, school_name: e.school_name,
                    parents:
                        e.parents!.map((e2) =>

                            ParentsDomainModel(user_id: e2.user_id, admin_id: e2.admin_id, school_id: e2.school_id, first_name: e2.first_name, gender: e2.first_name, is_active: e2.is_active)
                        ).toList()


                )
            ).toList()
        )
        );
  }

  @override
  DCStdDetApiResponseNetworkEntity mapToEntity(DCStdDetApiResponseDomainModel domain) {

    // return DataCentreApiResponseNetworkEntity(success: domain.success);
    return DCStdDetApiResponseNetworkEntity(success: domain.success, message: domain.message,
        data:
            DcStudentsDataNetworkEntity(
                students: domain.data?.students?.map((e) =>
                    StudentsNetworkEntity(student_id: e.student_id, admin_id:e.admin_id,
                        school_id: e.school_id, father_id: e.father_id, mother_id: e.mother_id, first_name: e.first_name, last_name: e.last_name,
                        gender: e.gender, pic: e.pic, is_active: e.is_active, date_create:e.date_create, date_update: e.date_update,
                        school_name: e.school_name,
                      parents:
                      e.parents!.map((e2) =>


                          ParentsNetworkEntity(user_id: e2.user_id, admin_id: e2.admin_id, school_id: e2.school_id, first_name: e2.first_name, gender: e2.gender, is_active: e2.is_active)
                      ).toList()


                    )).toList()
            )

        // domain.data?.map((d) => DataNetwDataSchoolsNetworkEntity(num_of_records: d.num_of_records)

        // ).toList()

    );
  }

}