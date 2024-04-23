import 'package:flutter/material.dart';

class AdminSchoolView extends StatefulWidget {
  const AdminSchoolView(/*{super.key}*/);

  @override
  State<AdminSchoolView> createState() => _AdminSchoolViewState();
}

class _AdminSchoolViewState extends State<AdminSchoolView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("admin schools"),
      // drawer: const BaseNavigationDrawer(),
      // appBar: AppBar(title: const Text("Dash")),

    );
  }
}
