import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/drivers/trips/driverTripViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverActiveTripsDataDomainModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DriverTripView extends StatefulWidget {
  const DriverTripView({Key? key}) : super(key: key);

  @override
  State<DriverTripView> createState() => _DriverTripViewState();
}

class _DriverTripViewState extends State<DriverTripView> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  final DriverTripViewModel _viewModel = Get.find<DriverTripViewModel>();

  // bool _isTripStarted = false;

  @override
  Widget build(BuildContext context) {
    _viewModel.getActiveTrips();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _karachi,
              zoom: 13,
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Obx(() {
              if (_viewModel.activeTripDetails.value == null) {
                return const Center(
                    child: Text('No active trip details available'));
              } else {
                var tripDetails = _viewModel.activeTripDetails.value!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tripDetails.route_title ?? '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(formattedDate),
                                    Text(formattedTime),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Students',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStudentInfoCard(
                                    'Total', tripDetails.count_total),
                                _buildStudentInfoCard(
                                    'Picked', tripDetails.count_picked),
                                _buildStudentInfoCard(
                                    'Absent', tripDetails.count_absent),
                                _buildStudentInfoCard(
                                    'Remaining', tripDetails.count_remaining),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    tripDetails.students != null
                        ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tripDetails.students!
                            .map(
                                (student) => _buildStudentCard(student))
                            .toList(),
                      ),
                    )
                        : Container(),
                  ],
                );
              }
            }),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Finish Trip',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // const navigate().todriverDashboardView();

                      _showFinishTripAlert();


                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentInfoCard(String title, int count) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          '$count',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStudentCard(
      DcDriverActiveTripsDataTripStudentsDomainModel student) {
    var img = 'assets/images/def_student.png';
    return GestureDetector(
      onTap: () => _showStudentPopup(student),
      child: Card(
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  img,
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: _getStatusColor(student.status ?? ''),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        student.status ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${student.first_name ?? ''} ${student.last_name ?? ''}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text('Address'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStudentPopup(
      DcDriverActiveTripsDataTripStudentsDomainModel student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${student.first_name ?? ''} ${student.last_name ?? ''}',
                  style: TextStyle(fontSize: 17)),
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Parent: Parent'),
              const SizedBox(height: 10),
              const Text('Contact #: Contact'),
              const SizedBox(height: 10),
              Text('Address: ${student.latitude}'),
            ],
          ),
          actions: <Widget>[

            student.status == 'next'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              'Pick Up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if(student.student_id!=null){
                                _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.PICKED_UP, onComplete: (){
                                  Navigator.of(context).pop();
                                });
                              }


                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Absent',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {

                              if(student.student_id!=null){
                                _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.ABSENT, onComplete: (){
                                  Navigator.of(context).pop();
                                });
                              }

                            },
                          ),
                        ),
                      ])
                : TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
          ],
        );
      },
    );
  }

  void _showFinishTripAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Finish Trip ?',
              style: TextStyle(fontSize: 17)),

          content: Text('Do you really want to Finish the Trip ?',
              style: TextStyle(fontSize: 14)),

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
                        'Finish',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {

                        _viewModel.finishTrip(trip_id: _viewModel.activeTripDetails.value?.trip_id??0, onComplete: (){

                          Navigator.of(context).pop();
                          // Navigator.of(context).pop();
                          navigate().back(res: true);

                        });


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

  Color _getStatusColor(String status) {
    Color statusColor = Colors.white;
    if (status == 'next') {
      statusColor = const Color.fromRGBO(255, 198, 7, 1);
    } else if (status == 'waiting') {
      statusColor = Colors.grey;
    } else if (status == 'pickedUp') {
      statusColor = Colors.green;
    } else if (status == 'absent') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.black;
    }

    return statusColor;
  }
}
