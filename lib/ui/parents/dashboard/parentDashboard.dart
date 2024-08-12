import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/ui/parents/dashboard/parentDashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ParentDashboard extends StatelessWidget {
  // const ParentDashboard({super.key});
  ParentDashboard({Key? key}) : super(key: key);

  final ParentDashboardViewModel _viewModel = Get.find<ParentDashboardViewModel>();



  @override
  Widget build(BuildContext context) {
    _viewModel.init();

    return Column(mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Obx(() =>

        _viewModel.showTripViewAction.value

            ?

        defaults.widget.flashCard(
          value: /*_viewModel.activeTripDetails.value?.trip_id.toString() ?? */"No Trips Found",
          title: "TRIPS"
        )
            :

        defaults.widget.flashCardActionable(
          value: _viewModel.activeTripDetails.value?.trip_id.toString() ?? "~",
          title: "TRIPS",
          buttonText: labelText.view_trip,
          buttonColor: Colors.black,
          onButtonPressed: () {
            // Fluttertoast.showToast(msg: "hey");
            navigate().toParentTripView();
          },
        ),


        ),
        // Obx(() =>
        //     defaults.widget.flashCard(value: "${_viewModel.vehicle.value?.vehicle_type ?? "~"} : ${_viewModel.vehicle.value?.reg_number ?? "~"}", title: "Vehicle"),
        // ),
        // Obx(() =>
        //   defaults.widget.flashCard(value: _viewModel.route.value?.route_title ?? "~", title: "Route")
        // ),
        // // Obx(() =>
        //   defaults.widget.flashCardActionable(value: /*_viewModel.tripToday.value[0].time_start ??*/ "No Trip Today", title: "Trips", onButtonPressed: () {
        //
        //     Fluttertoast.showToast(msg: "new trip");
        //
        //   },)
        // ),


      ],);

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
