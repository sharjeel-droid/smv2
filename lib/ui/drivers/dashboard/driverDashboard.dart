import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DriverDashboard extends StatelessWidget {
  // const DriverDashboard({super.key});
  DriverDashboard({Key? key}) : super(key: key);

  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    _viewModel.getDashboardDetails();

    var trip = 1;

    return Column(
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
            value: _viewModel.route.value?.route_title ?? "~", title: "Route")),
        // Obx(() =>
        trip == 1
            ? defaults.widget.flashCardActionable(
                value: "Continue Trip",
                title: "TRIPS",
                buttonText: 'CONTINUE TRIP',
                buttonColor: Colors.black,
                onButtonPressed: () {
                  Fluttertoast.showToast(msg: "continue trip");
                },
              )
            : defaults.widget.flashCardActionable(
                value: "Start a New Trip",
                title: "TRIPS",
                buttonText: 'NEW TRIP',
                buttonColor: Colors.black,
                onButtonPressed: () {
                  Fluttertoast.showToast(msg: "Start a New Trip");
                },
              )
        // ),
      ],
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
