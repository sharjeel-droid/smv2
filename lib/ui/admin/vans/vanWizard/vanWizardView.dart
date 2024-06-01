import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/admin/schools/adminSchoolViewModel.dart';
import 'package:SMV2/ui/admin/schools/schoolWizard/addSchoolWizardViewModel.dart';
import 'package:SMV2/ui/admin/students/studentWizard/studentWizardViewModel.dart';
import 'package:SMV2/ui/admin/vans/vanWizard/vanWizardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class VanWizardView extends StatelessWidget {
  VanWizardView({Key? key}) : super(key: key);

  final VanWizardViewModel _viewModel = Get.find<VanWizardViewModel>();






  @override
  Widget build(BuildContext context) {
  // _viewModel.getSchools();

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Add New VAN'),
      ),
      body: 
      // Text("add school here ....")
      Form(
        key: _viewModel.addVanFormKey(),
        child:
        SingleChildScrollView( // Allow scrolling if content overflows
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.vehicleRegNum.value,
                  hint: "Vehicle Registeration Number",
                  onError: (value)=> (value==null||value.isEmpty) ? ' cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleVehicleRegNumChanges(value)
                  }
              ),

              SizedBox(height: 10.0), // Add spacing between fields
              // defaults.widget.clickables.buttons.def(labelText: "School address", onPressed: (){
              //   // Fluttertoast.showToast(msg: "show address picker");
              //   navigate().toAddressPicker();
              // }),
              // _PlacePickerDialog(),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.vehicleType.value.toString(),
                  hint: "Vehicle Type",
                  onError: (value)=> (value==null||value.isEmpty) ? 'cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleVehicleTypeChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.driverName.value,
                  hint: "Driver's Name",
                  onError: (value)=> (value==null||value.isEmpty) ? ' cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleDriverNameChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.driverNIC.value,
                  hint: "Driver's NIC",
                  onError: (value)=> (value==null||value.isEmpty) ? 'cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleDriverNICChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.driverContact.value,
                  hint: "Driver Contact #",
                  onError: (value)=> (value==null||value.isEmpty) ? 'cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleDriverContactChanges(value)
                  }
              ),
              SizedBox(height: 10.0),
              defaults.widget.inputTexts.floatingLabeled(key:"",
                  initialValue:_viewModel.studentsList.value,
                  hint: "Students",
                  onError: (value)=> (value==null||value.isEmpty) ? ' cannot be empty' : null,
                  onSaved: (value)=> {
                    _viewModel.handleStudentListChanges(value)
                  }
              ),
              SizedBox(height: 20.0), // Add spacing after fields
              ElevatedButton(
                onPressed: (){
                  _viewModel.checkSubmission();
                }, // Handle form submission
                child: Row(mainAxisSize: MainAxisSize.min,

                  children: [
                    Text('Add New Van'),
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

  _PlacePickerDialog(){
    final controller = TextEditingController();
    return GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: ApiConst.GOOGLE_API_KEY,//"YOUR_GOOGLE_API_KEY",
        inputDecoration: InputDecoration(),
        debounceTime: 800, // default 600 ms,
        countries: ["in","fr"],// optional by default null is set
        isLatLngRequired:true,// if you required coordinates from place detail
        getPlaceDetailWithLatLng: (Prediction prediction) {
          // this method will return latlng with place detail
          print("placeDetails" + prediction.lng.toString());
        }, // this callback is called when isLatLngRequired is true
        itemClick: (Prediction prediction) {
          controller.text=prediction.description!;
          controller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
        },
        // if we want to make custom list item builder
        itemBuilder: (context, index, Prediction prediction) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(
              width: 7,
            ),
            Expanded(child: Text("${prediction.description??""}"))
          ],
        ),
      );
    },
    // if you want to add seperator between list items
    seperatedBuilder: Divider(),
    // want to show close icon
    isCrossBtnShown: true,
    // optional container padding
    containerHorizontalPadding: 10,




    );
  }
}