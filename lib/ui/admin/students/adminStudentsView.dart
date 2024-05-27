import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/students/adminStudentsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminStudentsView extends StatelessWidget {
  AdminStudentsView({Key? key}) : super(key: key);

  final AdminStudentsViewModel _viewModel = Get.find<AdminStudentsViewModel>();






  @override
  Widget build(BuildContext context) {
  // _viewModel.getSchools();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Students List'),
            Spacer(flex: 1,),

            IconButton(onPressed: (){
              // Fluttertoast.showToast(msg: "add school");
              // navigate().toSchoolWizard();
              // _viewModel.getSchools();
            }, icon: Icon(Icons.refresh)),

            IconButton(onPressed: (){
              // Fluttertoast.showToast(msg: "add school");
              navigate().toSchoolWizard();
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
      body: Obx(() =>
         ListView(
          children:
          (_viewModel.schools.isEmpty)?
        
              [ListTile(title: Text("no item found"),)]
        
          :
        
          _viewModel.schools!.map(
                  (item) =>

                  Column(
                    children: [
                      ListTile(title: Text(item!.school_name),subtitle: Text(item.contact_1),),
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
