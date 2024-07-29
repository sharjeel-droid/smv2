import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';

class DriverDashboard extends StatelessWidget {
  // const DriverDashboard({super.key});
  DriverDashboard({Key? key}) : super(key: key);

  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    _viewModel.getDashboardDetails();

    // final List<Map<String, String>> tripDetails = [
    //   {"date": "20 MAY, 2024 at 07:00 am", "status": "completed"},
    //   {"date": "20 MAY, 2024 at 07:00 am", "status": "completed"},
    // ];
    // var trips = _viewModel.stripToday.isNotEmpty ? 1 : 0;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => defaults.widget.flashCard(
                value: _viewModel.schools.value?.school_name ?? "~",
                title: "School Name"),
          ),
          Obx(
            () => defaults.widget.flashCard(
                value:
                    "${_viewModel.vehicle.value?.vehicle_type ?? "~"} : ${_viewModel.vehicle.value?.reg_number ?? "~"}",
                title: "Vehicle"),
          ),
          Obx(() => defaults.widget.flashCard(
              value: _viewModel.route.value?.route_title ?? "~",
              title: "Route")),
          // Obx(() =>
          /*Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Color(0XFF333333),
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Existing Column children
                ...tripDetails.map((trip) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trip['date']!,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          trip['status']!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                // Space between the Column and the new widget
                SizedBox(height: 20.0),

                // New child widget with a Card
                Container(
                  width: double.infinity, // Make the container take full width
                  child: Card(
                    color: Color(0xFF696767), // Card background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0, // Shadow depth
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        // Text with a background color
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0), // Background color for the text
                          padding: EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Color(0XFF808080),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Center(
                            child: Text(
                              'TRIPS',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        // Space between text and button
                        // Button with a background color
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Button action here
                              print('Button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // Button background color
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Minimize the size of the Row to fit its children
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the content in the Row
                              children: [
                                Text(
                                  'Click Me',
                                  style: TextStyle(
                                      color: Colors.black), // Text color
                                ),
                                SizedBox(width: 8.0),
                                Image.asset(
                                  'assets/images/def_student.png', // Path to your logo image asset
                                  height: 24.0, // Adjust the size as needed
                                ), // Space between the logo and the text
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),*/


          Obx(() =>


            defaults.widget.flashCardActionable(
            value: "hi",//_viewModel.shouldShowNewTripAction() ? new_trip : continue_trip,
            title: "TRIPS",
            content: Text("No Trip Today -> ${_viewModel.tripToday.value.length}"),
            buttonText: _viewModel.shouldShowNewTripAction() ? new_trip : continue_trip,
            buttonColor: Colors.black,
            onButtonPressed: () {

              _viewModel.shouldShowNewTripAction() ?
                Fluttertoast.showToast(msg: new_trip)
                  :
                Fluttertoast.showToast(msg: continue_trip);

              // Fluttertoast.showToast(msg: "continue trip");
              navigate().todriverTripView();
            },
            )
              // _viewModel.shouldShowNewTripAction() ? :

          )


          // trips == 1
          //     ? defaults.widget.flashCardActionable(
          //         value: "Continue Trip",
          //         title: "TRIPS",
          //         buttonText: 'CONTINUE TRIP',
          //         buttonColor: Colors.black,
          //         onButtonPressed: () {
          //           Fluttertoast.showToast(msg: "continue trip");
          //           navigate().toGoogleMap();
          //         },
          //       )
          //     : defaults.widget.flashCardActionable(
          //         value: "Start a New Trip",
          //         title: "TRIPS",
          //         buttonText: 'NEW TRIP',
          //         buttonColor: Colors.black,
          //         onButtonPressed: () {
          //           Fluttertoast.showToast(msg: "Start a New Trip");
          //           navigate().toGoogleMap();
          //         },
          //       )
        ],
      ),
    );
  }
}








// class DriverDashboard extends StatefulWidget {
//   const DriverDashboard(/*{super.key}*/);
//
//   @override
//   State<DriverDashboard> createState() => _DriverDashboardState();
// }
//
// class _DriverDashboardState extends State<DriverDashboard> {
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisSize: MainAxisSize.max,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//
//       defaults.widget.flashCard(value: "003", title: "Driver Dash")
//
//
//
//     ],);
//
//
//
//     //   Center(
//     //   child: Text("admin dash"),
//     //   // drawer: const BaseNavigationDrawer(),
//     //   // appBar: AppBar(title: const Text("Dash")),
//     //
//     // );
//   }
// }
