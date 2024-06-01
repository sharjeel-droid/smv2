import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/students/adminStudentsViewModel.dart';
import 'package:SMV2/ui/admin/vans/adminVansViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminVansView extends StatelessWidget {
  AdminVansView({Key? key}) : super(key: key);

  final AdminVansViewModel _viewModel = Get.find<AdminVansViewModel>();






  @override
  Widget build(BuildContext context) {
  _viewModel.getVans();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Students List'),
            Spacer(flex: 1,),

            IconButton(onPressed: (){
              // Fluttertoast.showToast(msg: "add school");
              // navigate().toSchoolWizard();
              _viewModel.getVans();
            }, icon: Icon(Icons.refresh)),

            IconButton(onPressed: (){
              Fluttertoast.showToast(msg: "add student");
              navigate().toStudentWizard();
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
      body: Obx(() =>
         ListView(
          children:
          (_viewModel.vehicles.isEmpty)?
        
              [ListTile(title: Text("no item found"),)]
        
          :
        
          _viewModel.vehicles!.map(
                  (item) =>

                  Column(
                    children: [
                      ListTile(title: Text("Van # ${item.reg_number}"),
                        subtitle: Text("driver : ${item.driver?.first_name}"),),
                      Divider()
                    ],
                  )
          ).toList()
        
          ,
        ),
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
