import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddSchoolWizardView extends StatelessWidget {
  AddSchoolWizardView({Key? key}) : super(key: key);

  final AddSchoolWizardViewModel _viewModel = Get.find<AddSchoolWizardViewModel>();






  @override
  Widget build(BuildContext context) {
  // _viewModel.getSchools();

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Add Schools'),
      ),
      body: 
      // Text("add school here ....")
      Form(
        key: _viewModel.addSchoolFormKey(),
        child:
        SingleChildScrollView( // Allow scrolling if content overflows
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Eight input fields with labels
              TextField(
                decoration: InputDecoration(
                  labelText: 'School Name',
                ),
              ),
              SizedBox(height: 10.0), // Add spacing between fields
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact #',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Supervisor Name',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'NIC #',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email Id',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact #',
                ),
              ),
              SizedBox(height: 20.0), // Add spacing after fields
              ElevatedButton(
                onPressed: () => print('Form Submitted'), // Handle form submission
                child: Row(mainAxisSize: MainAxisSize.min,

                  children: [
                    Text('Add School'),
                    Icon(Icons.add)
                  ],
                ),
              ),
            ],
          ),
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
