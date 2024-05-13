import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSchoolView extends StatelessWidget {
  AdminSchoolView({Key? key}) : super(key: key);

  final AdminSchoolViewModel _viewModel = Get.find<AdminSchoolViewModel>();






  @override
  Widget build(BuildContext context) {
  _viewModel.getSchools();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schools List'),
      ),
      body: ListView(
        children:
        (_viewModel.schools.value == null)?

            [ListTile(title: Text("no item found"),)]

        :

        _viewModel.schools.map(
                (item) =>
                ListTile(title: Text(item!.school_name))
        ).toList()

        ,
      ),
    );


    // return Center(
    //   child: Text("admin schools"),
    //   // drawer: const BaseNavigationDrawer(),
    //   // appBar: AppBar(title: const Text("Dash")),
    //
    // );
  }
}
