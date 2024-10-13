import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:SMV2/utils/DateTimeHandler.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as dev;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DriverDashboard extends StatelessWidget {
  DriverDashboard({Key? key}) : super(key: key);
  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();
  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    return Scaffold(
      backgroundColor: defaults.colors.SecondaryText,
      body: SafeArea(
          child: deviceConfig.screenType.isWeb()
              ? _viewForTablet(context)
              : deviceConfig.screenType.isTablet(context)
                  ? _viewForTablet(context)
                  : _viewForMobile(context)),
    );
  }

  Widget _viewForTablet(BuildContext context) {
    const Marker _marker = Marker(
      markerId: MarkerId('location_marker'),
      position: LatLng(24.8607, 67.0011), // Coordinates for Karachi
      infoWindow: InfoWindow(title: "Your Location"),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: defaults.colors.SecondaryText,
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: const BoxDecoration(
                                // shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/ic_avt_male_def.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: defaults.colors.PrimaryBlue,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("PICTURE",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800)),
                                          Icon(
                                            Icons.photo,
                                            color:
                                                defaults.colors.SecondaryText,
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: defaults.colors
                                            .SecondaryText, // Set color for the divider
                                        thickness:
                                            1, // Thickness of the divider
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Color",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800)),
                                          Icon(
                                            Icons.edit,
                                            color:
                                                defaults.colors.SecondaryText,
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: defaults.colors
                                            .SecondaryText, // Set color for the divider
                                        thickness:
                                            1, // Thickness of the divider
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("LINK",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800)),
                                          Icon(
                                            Icons.link,
                                            color:
                                                defaults.colors.SecondaryText,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: defaults.colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("REMOVE",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800)),
                                          Icon(
                                            Icons.close,
                                            color:
                                                defaults.colors.SecondaryText,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("M. Asad Sheikh",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                      Text("+92123456789",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 7),
                      Text(
                          "B/123, Block 'k', Nazimabad, Karachi, Sindh, Pakistan PK",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 17)),
                      const SizedBox(height: 7),
                      Container(
                        height:
                            MediaQuery.of(context).size.height * 0.80, // 50vh
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: GoogleMap(
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(
                                24.8607, 67.0011), // Coordinates of Karachi
                            zoom: 14.0,
                          ),
                          mapType: MapType.normal,
                          markers: {_marker},
                          onMapCreated: (GoogleMapController controller) {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _recentScheduledTripSection(),
                  const SizedBox(height: 5),
                  _onGoingTripSection(context),
                  const SizedBox(height: 5),
                  _recentTripSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewForMobile(BuildContext context) {
    // _viewModel.init();
    return Obx(() =>
        Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: defaults.colors.SecondaryText,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/ic_avt_male_def.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // "${_viewModel.firstName} ${_viewModel.lastName}",
                                    _viewModel.fullName.value,
                                    style: TextStyle(
                                        color: defaults.colors.PrimaryBlue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800)),
                                Text("${_viewModel.identifier.value}",
                                    style: TextStyle(
                                        color: defaults.colors.PrimaryBlue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: defaults.colors.PrimaryBlue,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/images/school-bus.png',
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                              flex: 2,
                              child: Obx(() => Text(
                                "${_viewModel.vehicle.value?.vehicle_type ?? "-"} : ${_viewModel.vehicle.value?.reg_number ?? "-"}",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: defaults.colors.PrimaryBlue),
                              )))
                        ],
                      )
                    ]),
                  ),
                ),
                const SizedBox(height: 5),
                _onGoingTripSection(context),
                const SizedBox(height: 5),
                _recentScheduledTripSection(),
                const SizedBox(height: 5),
                _recentTripSection(),
              ],
            ),
          ),
        )
    );



  }

  Widget _recentScheduledTripSection() {
    return Card(
      color: defaults.colors.SecondaryText,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TODAY'S SCHEDULED",
                  style: TextStyle(
                      fontSize: 24,
                      color: defaults.colors.PrimaryBlue,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(child: _buildScheduleTripRows()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onGoingTripSection(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            defaults.colors.Primary,
            defaults.colors.PrimaryLight
          ], // Define your gradient colors here
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
            BorderRadius.circular(10), // Match the border radius with the Card
      ),
      child: Card(
        color: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ON GOING TRIP",
                  style: TextStyle(
                      color: defaults.colors.SecondaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _viewModel.tripActive.value.isNotEmpty
                  ? Row(
                      children: [
                        // Image with border radius
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/school-bus.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Column with name, mobile, and text
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Wrap ListView.builder with a SizedBox to give it a height constraint
                              SizedBox(
                                height:
                                    100, // You can adjust this value as needed
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _viewModel.tripToday.length,
                                  itemBuilder: (context, index) {
                                    final trip = _viewModel.tripToday[index];
                                    return ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${trip.time_start ?? "N/A"} -> ${trip.status ?? "N/A"}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  defaults.font.size.small,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("started at: 00:00 am",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                          Text("expected to end at: 00:00 am",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                          Text("you are next to be picked up",
                                              style: TextStyle(
                                                  color: defaults
                                                      .colors.SecondaryText,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'No Trip Found',
                          style: TextStyle(
                              color: defaults.colors.SecondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _showNewTripAlert(context);
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color.fromARGB(5, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(1, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              color: defaults.colors.SecondaryText
                                  .withOpacity(0.1)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${_viewModel.route.value != null ? "View Trip" : "Start Trip"}",
                            style: TextStyle(
                                color: defaults.colors.SecondaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios,
                              color: defaults.colors.SecondaryText),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentTripSection() {
    return Card(
      color: defaults.colors.SecondaryText,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("RECENT TRIPS",
                    style: TextStyle(
                        fontSize: 24,
                        color: defaults.colors.PrimaryBlue,
                        fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios,
                    color: defaults.colors.PrimaryBlue),
              ],
            ),
            const SizedBox(height: 10),
            _buildTripRows(),
          ],
        ),
      ),
    );
  }

  Widget _buildTripRows() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              decoration: BoxDecoration(
                color: defaults.colors.PrimaryBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("Today",
                  style: TextStyle(
                      color: defaults.colors.SecondaryText,
                      fontWeight: FontWeight.w800,
                      fontSize: 15)),
            ),
          ],
        ),
        ExpansionTile(
          // leading: Icon(Icons.arrow_drop_down),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Started at 00:00 from abc, block n",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: defaults.colors.PrimaryBlue),
              ),
              Text("Ended at 00:00 from abc, block n",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: defaults.colors.PrimaryBlue))
            ],
          ),
          children: [
            const ListTile(
              title: Text("More details about the status..."),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScheduleTripRows() {
    List<Trip> trips = [
      Trip('Block A, Clifton', 'Block A, Clifton', '07:00 A.M.', '08:00 A.M.'),
      Trip('Block B, Gulshan', 'Block A, Clifton', '08:30 A.M.', '09:30 A.M.'),
      Trip('Block C, DHA', 'Block A, Clifton', '10:00 A.M.', '11:00 A.M.'),
      Trip('Block D, Saddar', 'Block A, Clifton', '11:30 A.M.', '12:30 P.M.'),
      Trip('Block E, Korangi', 'Block A, Clifton', '01:00 P.M.', '02:00 P.M.'),
    ];
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    decoration: BoxDecoration(
                      color: defaults.colors.PrimaryBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("ROUTE # 13",
                        style: TextStyle(
                            color: defaults.colors.SecondaryText,
                            fontWeight: FontWeight.w800,
                            fontSize: 13)),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Icon(
                    Icons.visibility,
                    color: defaults.colors.PrimaryBlue,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text(
                          trip.startLocation,
                          style: TextStyle(
                            fontSize: 11,
                            color: defaults.colors.PrimaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      trip.startTime,
                      style: TextStyle(
                        fontSize: 16,
                        color: defaults.colors.PrimaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_right,
                          color: defaults.colors.red,
                        ),
                        Text(
                          '${trip.startLocation}, ${trip.startTime}',
                          style: TextStyle(
                            fontSize: 10,
                            color: defaults.colors.PrimaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      trip.endTime,
                      style: TextStyle(
                        fontSize: 16,
                        color: defaults.colors.PrimaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: defaults.colors.PrimaryBlue,
              )
            ],
          ),
        );
      },
    );
  }

  Future _showNewTripAlert(BuildContext _context) async {
    return showModalBottomSheet(
      context: _context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // Adjust height based on content
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side: Text and first icon
                      Row(
                        children: [
                          Text('NEW TRIP',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: defaults.colors.PrimaryBlue,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 15),
                          Icon(FontAwesomeIcons.arrowUpRightFromSquare,
                              color: defaults.colors.PrimaryBlue),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Removes padding
                          minimumSize:
                              Size.zero, // Removes any minimum size constraints
                        ),
                        child: Icon(
                          Icons.close,
                          color: defaults.colors.PrimaryBlue,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // Icon(Icons.close),
                      // Icon(Icons.swap_vert),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 5,
                          right: 50,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          color: defaults.colors.PrimaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("DEPARTURE",
                            style: TextStyle(
                                color: defaults.colors.SecondaryText,
                                fontWeight: FontWeight.w800,
                                fontSize: 15)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.swap_vert, color: defaults.colors.PrimaryBlue),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ABC School',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: defaults.colors.SecondaryText)),
                          Text(
                              's/123, Block S, Jahangir Town, North Karachi, \nPakistan.',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: defaults.colors.SecondaryText)),
                          Text('15 Sep, 2024, 7:00 am.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: defaults.colors.SecondaryText)),
                        ],
                      )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.subdirectory_arrow_right,
                        color: defaults.colors.PrimaryBlue,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ABC School',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: defaults.colors.SecondaryText,
                                ),
                              ),
                              Text(
                                's/123, Block S, Jahangir Town, North Karachi, \nPakistan.',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: defaults.colors.SecondaryText,
                                ),
                              ),
                              Text(
                                '15 Sep, 2024, 7:00 am.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: defaults.colors.SecondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          flex: 10,
                          child: Text(
                            'Kamran Ahmed, Babar Azam and 23 others...',
                            style:
                                TextStyle(color: defaults.colors.PrimaryBlue),
                          )),
                      Expanded(
                          flex: 1,
                          child: Icon(Icons.visibility,
                              color: defaults.colors.PrimaryBlue))
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30, // 50vh
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target:
                            LatLng(24.8607, 67.0011), // Coordinates of Karachi
                        zoom: 14.0,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {},
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // _showNewTripAlert(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: defaults.colors.PrimaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: defaults.colors.SecondaryText),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 5),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Removes padding
                        minimumSize:
                            Size.zero, // Removes any minimum size constraints
                      ),
                      child: Stack(
                        alignment: Alignment.center, // Centers the text
                        children: [
                          Center(
                            child: Text(
                              "START NOW",
                              style: TextStyle(
                                color: defaults.colors.SecondaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0, // Positions the icon to the right
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: defaults.colors.SecondaryText,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _viewModel.startNewTrip(
                            route_id: _viewModel.route.value!.route_id,
                            trip_course: "arrival",
                            onComplete: () async {
                              bool res = await navigate().todriverTripView();
                              if (res == true) {
                                dev.log("refreshing dashboard details");
                                _viewModel.getDashboardDetails();
                              } else {
                                dev.log("not refreshing");
                              }
                            });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class Trip {
  final String startLocation;
  final String endLocation;
  final String startTime;
  final String endTime;

  Trip(this.startLocation, this.endLocation, this.startTime, this.endTime);
}

// class DriverDashboard extends StatelessWidget {
//   DriverDashboard({Key? key}) : super(key: key);

//   final _context = Get.find<BuildContext>();

//   final DriverDashboardViewModel _viewModel =
//       Get.find<DriverDashboardViewModel>();

//   @override
//   Widget build(BuildContext context) {
//     _viewModel.init(); //getDashboardDetails();

//     String newTrip = 'New Trip';
//     String continueTrip = 'Continue Trip';

//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Obx(
//             () => defaults.widget.flashCard(
//               value: _viewModel.schools.value?.school_name ?? "~",
//               title: "School Name",
//             ),
//           ),
//           Obx(
//             () => defaults.widget.flashCard(
//               value:
//                   "${_viewModel.vehicle.value?.vehicle_type ?? "~"} : ${_viewModel.vehicle.value?.reg_number ?? "~"}",
//               title: "Vehicle",
//             ),
//           ),
//           Obx(() => defaults.widget.flashCard(
//                 value: _viewModel.route.value?.route_title ?? "~",
//                 title: "Route",
//               )),
//           Obx(() {
//             return defaults.widget.flashCardActionable(
//               value: _viewModel.tripToday.value.isEmpty
//                   ? inforMessages.no_trips_today
//                   : "",
//               title: "TRIPS",
//               content: _viewModel.tripToday.isNotEmpty
//                   ? Center(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: _viewModel.tripToday.length,
//                         itemBuilder: (context, index) {
//                           final trip = _viewModel.tripToday[index];
//                           return ListTile(
//                             title: Center(
//                               child: Text(
//                                 '${trip.time_start ?? "N/A"} -> ${trip.status ?? "N/A"}',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: defaults.font.size.small,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   : null,
//               buttonText:
//                   _viewModel.tripActive.value.isEmpty ? newTrip : continueTrip,
//               buttonColor: Colors.black,
//               onButtonPressed: () {
//                 // if(_viewModel.route.value != null){
//                 //   _showNewTripAlert(context, _viewModel.route.value!!);
//                 // }

//                 if (_viewModel.tripActive.isNotEmpty) {
//                   // String message = _viewModel.tripActive.value.isEmpty
//                   //     ? newTrip
//                   //     : continueTrip;
//                   // Fluttertoast.showToast(msg: message);
//                   const navigate().todriverTripView();
//                 } else {
//                   if (_viewModel.route.value != null) {
//                     _showNewTripAlert(context, _viewModel.route.value!!);
//                   }

//                   // _showNewTripAlert(context);

//                   // Fluttertoast.showToast(msg: 'No Trip Found Today.');
//                 }
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   //customs
//   Future _showNewTripAlert(
//       BuildContext _context, DcDriverDashDataRouteDomainModel route) async {
//     return showDialog(
//       context: _context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('New Trip', style: TextStyle(fontSize: 17)),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('VAN # ${route.route_title}',
//                   style: TextStyle(fontSize: 14)),
//               Text(
//                   '${DateTimeHandler.dateTime_ymd_to_hm(route.time_start_approx ?? "~")} - ${DateTimeHandler.dateTime_ymd_to_hm(route.time_end_approx ?? "~")}',
//                   style: TextStyle(fontSize: 14)),
//               Text('starting address here..', style: TextStyle(fontSize: 14)),
//               Text('ending address here.', style: TextStyle(fontSize: 14)),
//             ],
//           ),
//           actions: <Widget>[
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Expanded(
//                 child: TextButton(
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text(
//                     'Start',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _viewModel.startNewTrip(
//                         route_id: route.route_id,
//                         trip_course: "arrival",
//                         onComplete: () async {
//                           bool res = await navigate().todriverTripView();
//                           if (res == true) {
//                             dev.log("refreshing dashboard details");
//                             _viewModel.getDashboardDetails();
//                           } else {
//                             dev.log("not refreshing");
//                           }
//                         });

//                     // _viewModel.finishTrip(trip_id: _viewModel.activeTripDetails.value?.trip_id??0, onComplete: (){
//                     //
//                     //   Navigator.of(context).pop();
//                     //   Navigator.of(context).pop();
//                     //
//                     // });

//                     // if(student.student_id!=null){
//                     //   _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.PICKED_UP);
//                     // }
//                   },
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextButton(
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: const Text('Cancel',
//                       style: TextStyle(color: Colors.white)),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     // if(student.student_id!=null){
//                     //   _viewModel.updateStudentTripStatus(studentId: student.student_id??0, status: StudentTripStatus.ABSENT);
//                     // }
//                   },
//                 ),
//               ),
//             ])
//           ],
//         );
//       },
//     );
//   }
// }
