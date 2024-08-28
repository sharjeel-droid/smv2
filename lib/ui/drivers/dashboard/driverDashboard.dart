import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/utils/DateTimeHandler.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as dev;

class DriverDashboard extends StatelessWidget {
  DriverDashboard({Key? key}) : super(key: key);

  final _context = Get.find<BuildContext>();

  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    _viewModel.init(); //getDashboardDetails();

    String newTrip = 'New Trip';
    String continueTrip = 'Continue Trip';

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => defaults.widget.flashCard(
              value: _viewModel.schools.value?.school_name ?? "~",
              title: "School Name",
            ),
          ),
          Obx(
            () => defaults.widget.flashCard(
              value:
                  "${_viewModel.vehicle.value?.vehicle_type ?? "~"} : ${_viewModel.vehicle.value?.reg_number ?? "~"}",
              title: "Vehicle",
            ),
          ),
          Obx(() => defaults.widget.flashCard(
                value: _viewModel.route.value?.route_title ?? "~",
                title: "Route",
              )),
          Obx(() {
            return defaults.widget.flashCardActionable(
              value: _viewModel.tripToday.value.isEmpty
                  ? inforMessages.no_trips_today
                  : "",
              title: "TRIPS",
              content: _viewModel.tripToday.isNotEmpty
                  ? Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _viewModel.tripToday.length,
                        itemBuilder: (context, index) {
                          final trip = _viewModel.tripToday[index];
                          return ListTile(

                            title: Center(
                              child: Text(
                                '${trip.time_start ?? "N/A"} -> ${trip.status ?? "N/A"}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: defaults.font.size.small,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : null,
              buttonText:
                  _viewModel.tripActive.value.isEmpty ? newTrip : continueTrip,
              buttonColor: Colors.black,
              onButtonPressed: () {
                // if(_viewModel.route.value != null){
                //   _showNewTripAlert(context, _viewModel.route.value!!);
                // }

                if (_viewModel.tripActive.isNotEmpty) {
                  // String message = _viewModel.tripActive.value.isEmpty
                  //     ? newTrip
                  //     : continueTrip;
                  // Fluttertoast.showToast(msg: message);
                  const navigate().todriverTripView();

                } else {

                  if(_viewModel.route.value != null){
                    _showNewTripAlert(context, _viewModel.route.value!!);
                  }

                  // _showNewTripAlert(context);

                  // Fluttertoast.showToast(msg: 'No Trip Found Today.');
                }
              },
            );
          }),
        ],
      ),
    );
  }



  //customs
  Future _showNewTripAlert(BuildContext _context, DcDriverDashDataRouteDomainModel route) async
  {
    return showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Trip',
              style: TextStyle(fontSize: 17)),

          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('VAN # ${route.route_title}',
                  style: TextStyle(fontSize: 14)),
              Text('${DateTimeHandler.dateTime_ymd_to_hm(route.time_start_approx ?? "~")} - ${DateTimeHandler.dateTime_ymd_to_hm(route.time_end_approx ?? "~")}',
                  style: TextStyle(fontSize: 14)),
              Text('starting address here..',
                  style: TextStyle(fontSize: 14)),
              Text('ending address here.',
                  style: TextStyle(fontSize: 14)),

            ],
          )
            ,


          actions: <Widget>[

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _viewModel.startNewTrip(route_id: route.route_id, trip_course: "arrival", onComplete:  () async{

                          bool res = await navigate().todriverTripView();
                          if(res == true){
                            dev.log("refreshing dashboard details");
                            _viewModel.getDashboardDetails();
                          }else{dev.log("not refreshing");}
                        });


                        // _viewModel.finishTrip(trip_id: _viewModel.activeTripDetails.value?.trip_id??0, onComplete: (){
                        //
                        //   Navigator.of(context).pop();
                        //   Navigator.of(context).pop();
                        //
                        // });


                        // if(student.student_id!=null){
                        //   _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.PICKED_UP);
                        // }


                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // if(student.student_id!=null){
                        //   _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.ABSENT);
                        // }

                      },
                    ),
                  ),
                ])

          ],
        );
      },
    );
  }
}
