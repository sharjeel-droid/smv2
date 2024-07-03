import 'dart:async';

import 'package:SMV2/constants/apiConstants.dart';
import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/login/loginViewModel.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

// class LoginView extends StatefulWidget {
//   // const LoginView({super.key});
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

class AddressPickerView extends StatelessWidget {
  AddressPickerView({Key? key}) : super(key: key);

  // final LoginViewModel _viewModel = Get.find<LoginViewModel>();
  // final _formKey_login = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Placeholder(child: Text("placeholder"),);



    // deviceConfig.screen.setToNormal();

    // String respo = Provider.of<LoginViewModel>(context).fetchTest();
    

    // var _email = "";

    // final Completer<GoogleMapController> _controller =
    // Completer<GoogleMapController>();
    //
    // const CameraPosition _kGooglePlex = CameraPosition(
    //   target: LatLng(37.42796133580664, -122.085749655962),
    //   zoom: 14.4746,
    // );

    // return defaults.layout.basic(bodyContent:
    //     SafeArea(child:
    //         Stack(children: [
    //
    //
    //           GoogleMap(
    //             mapType: MapType.hybrid,
    //             initialCameraPosition: _kGooglePlex,
    //             onMapCreated: (GoogleMapController controller) {
    //               _controller.complete(controller);
    //             },
    //           ),
    //
    //
    //           Positioned(
    //               top: 50,
    //               left: 50,
    //               right: 50,
    //
    //               child:
    //               // _PlacePickerDialog()
    //           ),
    //
    //         ],)
    //
    //
    //
    //
    //
    //     // _PlacePickerDialog()
    //     // Column(crossAxisAlignment: CrossAxisAlignment.center,
    //     //     mainAxisAlignment: MainAxisAlignment.start,
    //     //     mainAxisSize: MainAxisSize.max,
    //     //
    //     //   children: [
    //     //     Container(
    //     //       color: Colors.blue,
    //     //       child: _PlacePickerDialog(),
    //     //     )
    //     //
    //     //
    //     //
    //     //
    //     //   ],
    //     // )
    //
    //
    //
    //     )
    //
    //
    //
    // );

    // return SafeArea(child:
    //   defaults.layout.basic(bodyContent:
    //     Center(child: Text("hey login"))
    //   )
    // );
  }

  /*_PlacePickerDialog(){
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
  }*/
}
