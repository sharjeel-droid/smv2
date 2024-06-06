import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class DriverDashboard extends StatelessWidget {
  // const DriverDashboard({super.key});
  DriverDashboard({Key? key}) : super(key: key);

  final DriverDashboardViewModel _viewModel = Get.find<DriverDashboardViewModel>();



  @override
  Widget build(BuildContext context) {

    return Column(mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        defaults.widget.flashCard(value: "003", title: "Driver Dash")

      ],);

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
