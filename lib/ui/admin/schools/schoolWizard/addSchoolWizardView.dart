import 'package:SMV2/constants/uiConstants.dart';
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
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.schoolName.value,
                  hint: "School Name",
                  onError: (value)=> (value==null||value.isEmpty) ? 'School Name cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSchoolNameChanges(value)
                  }
              ),

              SizedBox(height: 10.0), // Add spacing between fields
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.schoolAddress.value,
                  hint: "School Address",
                  onError: (value)=> (value==null||value.isEmpty) ? 'School Address cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSchoolAddressChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"contact",
                  initialValue:_viewModel.schoolContact.value,
                  hint: "School Contact #",
                  onError: (value)=> (value==null||value.isEmpty) ? 'School Contact cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSchoolContactChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"supervisor name",
                  initialValue:_viewModel.supervisorName.value,
                  hint: "Supervisor's Name",
                  onError: (value)=> (value==null||value.isEmpty) ? 'Supervisor Name cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSupervisorNameChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"nic",
                  initialValue:_viewModel.supervisorNIC.value,
                  hint: "Supervisor NIC",
                  onError: (value)=> (value==null||value.isEmpty) ? 'Supervisor NIC cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSupervisorNICChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"email",
                  initialValue:_viewModel.supervisorEmail.value,
                  hint: "Supervisor Email",
                  onError: (value)=> (value==null||value.isEmpty) ? 'Supervisor Email cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSupervisorEmailChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.supervisorAddress.value,
                  hint: "Supervisor Address",
                  onError: (value)=> (value==null||value.isEmpty) ? 'School Name cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSupervisorAddressChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.supervisorContact.value,
                  hint: "Supervisor Contact",
                  onError: (value)=> (value==null||value.isEmpty) ? 'Supervisor Contact cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleSupervisorContactChanges(value)
                  }
              ),
              SizedBox(height: 20.0), // Add spacing after fields
              ElevatedButton(
                onPressed: (){
                  _viewModel.checkSubmission();
                }, // Handle form submission
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
