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
  _viewModel.getStudents();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Students List'),
            Spacer(flex: 1,),

            IconButton(onPressed: (){
              // Fluttertoast.showToast(msg: "add school");
              // navigate().toSchoolWizard();
              _viewModel.getStudents();
            }, icon: Icon(Icons.refresh)),

            IconButton(onPressed: (){
              Fluttertoast.showToast(msg: "add student");
              // navigate().toSchoolWizard();
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
      body: Obx(() =>
         ListView(
          children:
          (_viewModel.students.isEmpty)?
        
              [ListTile(title: Text("no item found"),)]
        
          :
        
          _viewModel.students!.map(
                  (item) =>

                  Column(
                    children: [
                      ListTile(title: Text(item!.first_name),subtitle: Text("parent : ${item.parents?[0].first_name}"),),
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
