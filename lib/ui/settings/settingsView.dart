import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView(/*{super.key}*/);

  @override
  State<SettingsView> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Center(child: Text("Setting view"),
    )
    );
  }
}
