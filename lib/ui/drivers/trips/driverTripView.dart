import 'dart:async';
import 'dart:collection';
import 'package:SMV2/constants/navigationConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:intl/intl.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/drivers/trips/driverTripViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverActiveTripsDataDomainModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:convert';

class DriverTripView extends StatefulWidget {
  const DriverTripView({Key? key}) : super(key: key);

  @override
  State<DriverTripView> createState() => _DriverTripViewState();
}

class _DriverTripViewState extends State<DriverTripView> {
  Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  final DriverTripViewModel _viewModel = Get.find<DriverTripViewModel>();

  @override
  Widget build(BuildContext context) {
    // Start loading trips
    _viewModel.getActiveTrips();

    return Scaffold(
      body: Obx(() {
        // Show a loading spinner while the data is being fetched
        if (_viewModel.isProcessing.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Check if the trip details are available
        final tripDetails = _viewModel.activeTripDetails.value;
        if (tripDetails == null) {
          return Center(child: Text("No active trips found"));
        }

        // Only proceed when data is available
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(now);
        String formattedTime = DateFormat('hh:mm a').format(now);
        LatLng? startingPoint;

        if (tripDetails.route_direction_string != null) {
          String? jsonString = tripDetails.route_direction_string;
          if (jsonString != null) {
            Map<String, dynamic> decodedJson = jsonDecode(jsonString);
            List<String> polylinePoints = [];

            for (var route in decodedJson['routes']) {
              for (var leg in route['legs']) {
                for (var step in leg['steps']) {
                  polylinePoints.add(step['polyline']['points']);
                }
              }
            }

            for (String polyline in polylinePoints) {
              List<LatLng> points = _viewModel.decodePolyline(polyline);

              for (var i = 0; i < points.length; i++) {
                if (i == 0) {
                  startingPoint = points[i];
                }
                _markers.add(Marker(
                  markerId: MarkerId(i.toString()),
                  position: points[i],
                  icon: BitmapDescriptor.defaultMarker,
                ));
                _polyline.add(Polyline(
                  polylineId: PolylineId(i.toString()),
                  points: points,
                  color: Colors.red,
                  width: 2,
                ));
              }
            }
          }
        }

        LatLng initialLocation = startingPoint!;

        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialLocation,
                zoom: 13,
              ),
              mapType: MapType.normal,
              markers: _markers,
              polylines: _polyline,
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
            ),
            Positioned(
              top: 10,
              left: 5,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tripDetails.route_title ?? '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                .map((student) => _buildStudentCard(student))
                                .toList(),
                          ),
                        )
                      : Container(),
                ],
              ),
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )),
          ],
        );
      }),
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
                            onPressed: () {},
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
                            onPressed: () {},
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
