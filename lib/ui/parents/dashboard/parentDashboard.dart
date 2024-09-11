import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/ui/parents/dashboard/parentDashboardViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:SMV2/utils/deviceConfigHandler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParentDashboard extends StatelessWidget {
  ParentDashboard({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> studentData = [
    {'name': 'Ahmed Khan', 'icon': Icons.visibility},
    {'name': 'Ali Raza', 'icon': Icons.visibility},
    {'name': 'Khan', 'icon': Icons.visibility},
  ];
  // final ParentDashboardViewModel _viewModel = Get.find<ParentDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    // _viewModel.init();

    return Scaffold(
      backgroundColor: defaults.colors.SecondaryText,
      body: SafeArea(
        child: deviceConfig.screenType.isWeb()
            ? _viewForTablet(context)
            : deviceConfig.screenType.isTablet(context)
                ? _viewForTablet(context)
                : _viewForMobile(),
      ),
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
                      Text("Mutahir Rehman",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                      Text("+92123456789",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      Text("3 kids registered",
                          style: TextStyle(
                              color: defaults.colors.PrimaryBlue,
                              fontSize: 17)),
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
                  _onGoingTripSection(),
                  const SizedBox(height: 5),
                  _recentTripSection(),
                  const SizedBox(height: 5),
                  _schoolSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewForMobile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // First Card
            Card(
              color: defaults.colors.SecondaryText,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    // Image with border radius
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 50,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/ic_avt_male_def.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Column with name, mobile, and text
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mutahir Rehman",
                              style: TextStyle(
                                  color: defaults.colors.PrimaryBlue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800)),
                          Text("+92123456789",
                              style: TextStyle(
                                  color: defaults.colors.PrimaryBlue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          Text("3 kids registered",
                              style: TextStyle(
                                  color: defaults.colors.PrimaryBlue,
                                  fontSize: 17)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),

            _onGoingTripSection(),

            const SizedBox(height: 5),

            _recentTripSection(),

            const SizedBox(height: 5),

            _schoolSection(),
          ],
        ),
      ),
    );
  }

  Widget _onGoingTripSection() {
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
              Row(
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
                          image: AssetImage('assets/images/school-bus.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Column with name, mobile, and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("started at: 00:00 am",
                          style: TextStyle(
                              color: defaults.colors.SecondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                      Text("expected to end at: 00:00 am",
                          style: TextStyle(
                              color: defaults.colors.SecondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                      Text("you are next to be picked up",
                          style: TextStyle(
                              color: defaults.colors.SecondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add button action
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: const Color.fromARGB(5, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(1, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color:
                                defaults.colors.SecondaryText.withOpacity(0.1)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "View Trip",
                          style: TextStyle(
                              color: defaults.colors.SecondaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios,
                            color: defaults.colors.SecondaryText),
                      ],
                    ),
                  ),
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

  Widget _schoolSection() {
    return Card(
      color: defaults.colors.SecondaryText,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/school.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Deenway Academy",
                          style: TextStyle(
                              fontSize: 17,
                              color: defaults.colors.PrimaryBlue,
                              fontWeight: FontWeight.bold)),
                      Text("a/123, abc road, Karachi, Pakistan",
                          style: TextStyle(
                              fontSize: 14,
                              color: defaults.colors.PrimaryBlue)),
                      Text("+9845645645",
                          style: TextStyle(
                              fontSize: 14,
                              color: defaults.colors.PrimaryBlue)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: defaults.colors.PrimaryBlue, // Set color for the divider
              thickness: 1, // Thickness of the divider
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/student.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the start
                    children: _buildChildrenFromArray(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChildrenFromArray() {
    return studentData.map((data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['name'],
                style:
                    TextStyle(fontSize: 15, color: defaults.colors.PrimaryBlue),
              ),
              Icon(
                data['icon'],
                color: defaults.colors.PrimaryBlue,
              ),
            ],
          ),
          Divider(
            color: defaults.colors.PrimaryBlue, // Set color for the divider
            thickness: 1, // Thickness of the divider
          ),
        ],
      );
    }).toList();
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
            ListTile(
              title: Text("More details about the status..."),
            ),
          ],
        ),
      ],
    );
  }
}




// class ParentDashboard extends StatefulWidget {
//   const ParentDashboard(/*{super.key}*/);
//
//   @override
//   State<ParentDashboard> createState() => _ParentDashboardState();
// }
//
// class _ParentDashboardState extends State<ParentDashboard> {
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
