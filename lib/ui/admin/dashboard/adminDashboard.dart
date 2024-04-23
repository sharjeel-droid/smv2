import 'package:SMV2/constants/uiConstants.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard(/*{super.key}*/);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {






  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [

      defaults.widget.flashCard(value: "003", title: "schools")



    ],);



    //   Center(
    //   child: Text("admin dash"),
    //   // drawer: const BaseNavigationDrawer(),
    //   // appBar: AppBar(title: const Text("Dash")),
    //
    // );
  }
}
