import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DriverDashboard extends StatelessWidget {
  DriverDashboard({Key? key}) : super(key: key);

  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    _viewModel.getDashboardDetails();

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
            String text = '';
            List<DcDriverDashDataTripDetsDomainModel> tripList =
                _viewModel.shouldShowNewTripAction()
                    ? _viewModel.tripActive
                    : _viewModel.tripToday;

            int counter = 0;
            int len = tripList.length;

            tripList.forEach((trip) {
              counter++;
              text += '${trip.time_start ?? "N/A"} -> ${trip.status ?? "N/A"}';
              if (counter < len) {
                text += '\n';
              }
            });

            return defaults.widget.flashCardActionable(
              value:
                  _viewModel.shouldShowNewTripAction() ? newTrip : continueTrip,
              title: "TRIPS",
              content: Text(
                text.isNotEmpty ? text : "No Trip Today",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: defaults.font.size.body,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buttonText:
                  _viewModel.shouldShowNewTripAction() ? newTrip : continueTrip,
              buttonColor: Colors.black,
              onButtonPressed: () {
                String message = _viewModel.shouldShowNewTripAction()
                    ? newTrip
                    : continueTrip;
                Fluttertoast.showToast(msg: message);
                const navigate().todriverTripView();
              },
            );
          }),
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
