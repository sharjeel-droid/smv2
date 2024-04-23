import 'package:flutter/material.dart';

class AdminSupervisorView extends StatefulWidget {
  const AdminSupervisorView(/*{super.key}*/);

  @override
  State<AdminSupervisorView> createState() => _AdminSupervisorViewState();
}

class _AdminSupervisorViewState extends State<AdminSupervisorView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("admin suervisors"),
      // drawer: const BaseNavigationDrawer(),
      // appBar: AppBar(title: const Text("Dash")),

    );
  }
}
